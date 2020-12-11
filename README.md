# Structure-preserving-Image-Smoothing
Image smoothing is a fundamental tool in computer graphics and image processing, whose major challenge is to smooth the input image while preserving its salient structure features. Recently, a piecewise smooth approach called L0 gradient minimization has been proposed for image smoothing. It employs gradient sparsity to achieve locally identical effect, which excels existing methods, making the visual performance more satisfying. However, methods based on L0 gradient minimization can easily cause staircase effect and lose part of structure. In this paper, we make the best of L0 gradient minimization and gradient fidelity term to present a new smoothing method. Our method can maintain the main structure of the image and restrain the staircase effect to make the gradient smoother. The essential structure in similar RGB values is preserved as well. Experimental results illustrate that our method applies widely, and particularly beneficial to image composition, edge detection and clip-art JPEG artifact removal, etc.

## High-Level ideas
The proposed method can remove unnecessary details while miantaining the salient structures. The following is a 1D scanline example.
<img src="/results/illustration.png" width="1000">

To better illustrate the power of the proposed, we also can see the gradient map in the following image where different structure may have similar colors in nearby regions. The proposed method can detect the structures compared with other L0 base methods.
![Gradient_Map](/results/gradient_map.png)

Here is another example that illustrates the power of the proposed method.
![example](/results/extract_structure.png)

## Comparisons
Compared with other well-known methods, the proposed method can address all three concerns raised in image smoothing: Staircase Effect, Edge Blur and Structure Destroy.
<img src="/results/math.png" width="900">

## Objective Function
The energy functional minimization can be expressed as follows. Please Refer to the paper for how to solve this problem.
<img src="/results/objective_function.png" width="400">

## Algorithms
<img src="/results/algorithm.png" width="600">

The following figure illustrates the convergence speed w.r.t two L0 based methods. Our method converges at 10 iterations with the lowest difference. Our matlba implementation takes 5 secs to process a single channel 400x600 image on a machine with Intel Core i5@CPU 2.27G.

<img src="/results/convergence.png" width="400">

Please cite the following paper if it helps your research:

      @article{ding2014structure,
        title={Structure-preserving image smoothing with L 0 gradient mini-mization coupling gradient fidelity term},
        author={DING, ZhiPeng and ZHANG, ShaoXiong and CHEN, JiaZhou and PENG, QunSheng and WANG, ZhangYe},
        journal={SCIENTIA SINICA Informationis},
        volume={44},
        number={11},
        pages={1370--1384},
        year={2014},
        publisher={Science China Press}
      }

## Applications:
### 1. Denoising
![Denoising_1D](/results/1D_example.png)
![Denoising_2D](/results/denoising.png)

### 2. JPEG Artifact Removal
![JPEG_1](/results/jpeg_artfacts_removal_1.png)
![JPEG_2](/results/jpeg_artfacts_removal_2.png)
<img src="/results/quantitative_results_of_jpeg_artifacts_removal.png" width="600">

### 3. Boundary Extraction
![boundary_extraction](/results/canny_boundary_extraction.png)

### 4. Non-realistic Photo Abstraction
![abstraction](/results/nonphotorealistic_rendering.png)

### 5. Image Composition
![composition](/results/photo_composition.png)

### 6. HDR Tone Mapping
![hdr](/results/hdr_tonemaping.png)

### 7. Colorization
![manga](/results/colorization_1.png)
![sketch](/results/colorization_2.png)

