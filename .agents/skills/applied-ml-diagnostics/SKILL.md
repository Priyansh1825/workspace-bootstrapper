---
name: applied-ml-diagnostics
description: End-to-end best practices for Medical & Agricultural Image Classification, Predictive Maintenance, Transfer Learning, Imbalanced Data handling, and Model Evaluation.
---

# Applied ML & Diagnostic Systems Skill

Apply this skill when working on image classification, disease diagnosis, failure prediction, or tabular anomaly detection (`agriculture-disease-detector`, `Skin disease`, `predictive-maintenance`, `v2x-anomaly-detection`).

## 1. Transfer Learning & Backbone Selection
* **Model Choices:** 
  * Mobile/Edge deployment: `EfficientNet-B0/B2`, `MobileNetV3-Large`.
  * High-accuracy medical/agricultural classification: `ConvNeXt-Tiny/Small` or `ResNet50-d`.
* **Fine-Tuning Protocol:**
  1. Freeze the backbone and train only the classification head for 3–5 epochs at higher LR (`1e-3`).
  2. Unfreeze the top layers (or full model) with a reduced learning rate (`1e-4` to `1e-5`) using a Cosine Annealing scheduler.

## 2. Handling Imbalanced Datasets (Critical in Medical & Fault Detection)
* **Loss Functions:** Use **Focal Loss** or **Class-Weighted CrossEntropy** when minority disease classes are underrepresented:
  $$\text{weight}_c = \frac{N_{total}}{K \times N_c}$$
* **Evaluation Metrics:** Never rely on accuracy alone. Always evaluate:
  * **Macro-F1 Score & Precision-Recall AUC (PR-AUC)**.
  * **Confusion Matrix** with sensitivity/recall per disease class.
  * **Specificity vs. Sensitivity trade-off curves**.

## 3. Data Augmentation (Albumentations)
* Apply domain-specific augmentations (Random Crop, Horizontal/Vertical Flip, ShiftScaleRotate, ColorJitter, GaussNoise, Cutout).
* For agricultural/skin lesions, avoid color manipulations that change diagnostic hue/saturation features.

## 4. Production Export
* Export trained models to **ONNX** or **TorchScript** for inference engines.
* Add sample preprocessing pipelines (normalization with ImageNet mean/std) directly inside the export or serving wrapper.
