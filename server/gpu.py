import torch

# CUDA 지원 여부 확인
if torch.cuda.is_available():
    # 현재 사용 가능한 GPU의 개수 확인
    gpu_count = torch.cuda.device_count()
    print(f"사용 가능한 GPU 수: {gpu_count}")

    # 각 GPU의 정보 출력
    for i in range(gpu_count):
        gpu_info = torch.cuda.get_device_properties(i)
        print(f"GPU {i + 1}: {gpu_info.name}, Compute Capability: {gpu_info.major}.{gpu_info.minor}")

    # 현재 선택된 GPU 확인
    current_gpu = torch.cuda.current_device()
    print(f"\n현재 선택된 GPU: {current_gpu}")

else:
    print("CUDA 지원 GPU가 없습니다. CPU 모드로 진행합니다.")