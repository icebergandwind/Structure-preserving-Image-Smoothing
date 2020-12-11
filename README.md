# Structure-preserving-Image-Smoothing

# High-Level ideas
![Illustration](/results/illustration.png)

![Gradient_Map](/results/gradient_map.png)

![example](/results/extract_structure.png)

# Comparisons
<img src="/results/math.png" width="900">

# Algorithms
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

# Applications:
## 1. Denoising
![Denoising_1D](/results/1D_example.png)
![Denoising_2D](/results/denoising.png)

## 2. JPEG Artifact Removal
![JPEG_1](/results/jpeg_artfacts_removal_1.png)
![JPEG_2](/results/jpeg_artfacts_removal_2.png)
![JPEG_3](/results/quantitative_results_of_jpeg_artifacts_removal.png)

## 3. Boundary Extraction
![boundary_extraction](/results/canny_boundary_extraction.png)

## 4. Non-realistic Photo Abstraction
![abstraction](/results/nonphotorealistic_rendering.png)

## 5. Image Composition
![composition](/results/photo_composition.png)

## 6. HDR Tone Mapping
![hdr](/results/hdr_tonemaping.png)

## 7. Colorization
![manga](/results/colorization_1.png)
![sketch](/results/colorization_2.png)

