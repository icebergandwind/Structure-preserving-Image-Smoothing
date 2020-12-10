function S = L0L2H(Im, lambda, kappa, alpha)

if ~exist('kappa','var')
    kappa = 2.0;
end
if ~exist('lambda','var')
    lambda = 1e-2;
end
if ~exist('alpha','var')
    alpha = 1e-1;
end

S = im2double(Im);
I = im2double(Im);
betamax = 1e5;
fx = [1, -1];
fy = [1; -1];
[N,M,D] = size(Im);
sizeI2D = [N,M];
otfFx = psf2otf(fx,sizeI2D);
otfFy = psf2otf(fy,sizeI2D);

Normin1 = fft2(S);
Denormin2 = abs(otfFx).^2 + abs(otfFy).^2;

if D>1
    Denormin2 = repmat(Denormin2,[1,1,D]);
end
beta = 2*lambda;
%r=1;
while beta < betamax
    Denormin   = 1 + (beta+alpha).*Denormin2.*Denormin2;
    % h-v subproblem
    h = [diff(S,1,2), S(:,1,:) - S(:,end,:)];
    v = [diff(S,1,1); S(1,:,:) - S(end,:,:)];
    if D==1
        t = (h.^2+v.^2)<lambda/beta;
    else
        t = sum((h.^2+v.^2),3)<lambda/beta;
        t = repmat(t,[1,1,D]);
    end
    h(t)=0; v(t)=0;
    % S subproblem
    Normin2 = [h(:,end,:) - h(:, 1,:), -diff(h,1,2)];
    Normin2 = Normin2 + [v(end,:,:) - v(1, :,:); -diff(v,1,1)];

    temph = [diff(Normin2,1,2), Normin2(:,1,:) - Normin2(:,end,:)];
    tempv = [diff(Normin2,1,1); Normin2(1,:,:) - Normin2(end,:,:)];
    Normin3 = [temph(:,end,:) - temph(:, 1,:), -diff(temph,1,2)];
    Normin3 = Normin3 + [tempv(end,:,:) - tempv(1, :,:); -diff(tempv,1,1)];
    
    sech = [I(:,2,:)-I(:,1,:),diff(I,2,2),I(:,end-1,:)-I(:,end,:)];
    secv = [I(2,:,:)-I(1,:,:);diff(I,2,1);I(end-1,:,:)-I(end,:,:)];
    Q = sech + secv;
    firh = [Q(:,2,:)-Q(:,1,:),diff(Q,2,2),Q(:,end-1,:)-Q(:,end,:)];
    firv = [Q(2,:,:)-Q(1,:,:);diff(Q,2,1);Q(end-1,:,:)-Q(end,:,:)];
    I1 = firh + firv;

    FS = (Normin1 + beta.*fft2(Normin3) + alpha.*(fft(I1,[],1)+fft(I1,[],2)))./Denormin;
    S = real(ifft2(FS));

    beta = beta*kappa;

    fprintf('.');
end
fprintf('\n');
end
