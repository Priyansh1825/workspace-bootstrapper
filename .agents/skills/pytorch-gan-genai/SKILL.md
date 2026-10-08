---
name: pytorch-gan-genai
description: Deep learning patterns for Generative Adversarial Networks (CycleGAN, DCGAN), Custom PyTorch Architectures, Adversarial Loss balancing, and GPU training stability.
---

# PyTorch GAN & Generative AI Skill

Apply this skill when working on generative models, image translation, GAN architectures, and custom PyTorch training loops (`CycleGAN_Project`, `AI_DCGAN`).

## 1. GAN Architecture & Stabilization Guidelines
* **Normalization Layers:** Use `nn.InstanceNorm2d` (affine=False) for image-to-image translation (CycleGAN) and `nn.BatchNorm2d` (with momentum=0.8) for unconditional generation (DCGAN). Avoid BatchNorm in CycleGAN generators to preserve style independence.
* **Activation Functions:** Use `nn.LeakyReLU(0.2, inplace=True)` in Discriminators to prevent dying gradients. Use `nn.ReLU(inplace=True)` in Generators, with `nn.Tanh()` in the final output layer.
* **Weights Initialization:** Initialize Conv/ConvTranspose weights with `torch.nn.init.normal_(m.weight.data, 0.0, 0.02)`.

## 2. Loss Functions & Training Dynamics
* **Cycle-Consistency Loss Weighting:** In CycleGAN, balance losses:
  $$\mathcal{L}_{total} = \mathcal{L}_{GAN}(G) + \mathcal{L}_{GAN}(F) + \lambda_{cycle} \mathcal{L}_{cycle} + \lambda_{identity} \mathcal{L}_{id}$$
  Standard defaults: $\lambda_{cycle} = 10.0$, $\lambda_{identity} = 5.0$ (or $0.5 \times \lambda_{cycle}$).
* **One-Sided Label Smoothing:** When training the discriminator, use `0.9` instead of `1.0` for real targets to prevent discriminator overconfidence.
* **Replay Buffer (History Buffer):** Use a 50-image history buffer for updating discriminators to reduce model oscillation.

## 3. GPU Memory & Mixed Precision Training
* Use PyTorch Automatic Mixed Precision (`torch.cuda.amp.autocast()` and `GradScaler()`) to double batch throughput and halve VRAM usage:
  ```python
  scaler = torch.cuda.amp.GradScaler()
  with torch.cuda.amp.autocast():
      disc_loss = compute_loss(...)
  scaler.scale(disc_loss).backward()
  scaler.step(opt_disc)
  scaler.update()
  ```
* Save checkpoints with both Generator and Discriminator states, optimizer states, and epoch numbers.
