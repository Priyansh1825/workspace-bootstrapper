---
name: computer-vision-tracking
description: Expert guidance for OpenCV, YOLOv8, MediaPipe, Multi-camera re-identification, DeepSORT/ByteTrack, and real-time low-latency video streaming pipelines.
---

# Computer Vision & Real-time Tracking Skill

Apply this skill when working on object detection, face recognition, hand tracking, multi-camera re-identification, or video pipeline optimization (`Industrial_MultiCamera_Tracking`, `face-recognition-system`, `hand-tracked-builder`, `Sign_Language_Translator`).

## 1. Frame Processing & Pipeline Architecture
* **Decouple Capture & Inference:** Never run heavy model inference directly inside the camera capture loop. Use threading or `asyncio.Queue` with a worker pool to prevent frame drops.
* **Resolution Scaling:** Downscale frames before inference (e.g., `cv2.resize(frame, (640, 640))`) and re-project bounding boxes back to original coordinate space.
* **Colorspace Consistency:** Remember that OpenCV reads in **BGR** while PyTorch/YOLO/MediaPipe expect **RGB**. Always do `cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)` before tensor conversion.

## 2. Tracking & Multi-Camera Re-ID Best Practices
* **Tracking State Management:** Use ByteTrack or DeepSORT with a Kalman filter for occlusion handling. Maintain track IDs with a time-to-live (`max_age`) threshold.
* **Feature Embeddings & Vector Search:** For cross-camera tracking, extract normalized feature embeddings using a lightweight Re-ID backbone (e.g., OSNet, ResNet50-IBN) and index them in Milvus or FAISS.
* **Cosine Distance Threshold:** Set cosine similarity threshold between `0.65 - 0.75` for matching identities across disjoint camera views.

## 3. High-Performance Optimization (CUDA & TensorRT)
* Enable `torch.backends.cudnn.benchmark = True` when input frame sizes are fixed.
* Convert models to **ONNX** or **TensorRT (FP16)** for 3x-5x speedups on NVIDIA GPUs.
* Release video captures and window handles cleanly in `finally` blocks:
  ```python
  cap.release()
  cv2.destroyAllWindows()
  ```
