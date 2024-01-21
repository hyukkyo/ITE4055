import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader
from torchvision import datasets, transforms, models
from torchvision.datasets import ImageFolder
from torch.utils.data.sampler import SubsetRandomSampler

# GPU 사용 가능 여부 확인
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# 데이터 전처리 및 로드
data_transform = transforms.Compose([
    transforms.Resize((128, 128)),
    transforms.ToTensor(),
])

# 데이터셋 경로 설정
dataset_path = r'C:\Users\hyukkyo\ITE4055\server\a-large-scale-fish-dataset/Fish_Dataset/Fish_Dataset'

# Fish Dataset 클래스 정의
class FishDataset(ImageFolder):
    def __init__(self, root, transform=None):
        super(FishDataset, self).__init__(root, transform=transform)

# FishDataset 인스턴스 생성
fish_dataset = FishDataset(root=dataset_path, transform=data_transform)

# 학습 데이터와 검증 데이터로 분리
# train_size = int(0.8 * len(fish_dataset))
train_size = len(fish_dataset)
# val_size = len(fish_dataset) - train_size
# train_dataset, val_dataset = torch.utils.data.random_split(fish_dataset, [train_size, val_size])
train_dataset = fish_dataset

# 데이터 로더 설정
# train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True, num_workers=4)
# val_loader = DataLoader(val_dataset, batch_size=64, shuffle=False, num_workers=4)
train_loader = DataLoader(train_dataset, batch_size=64)
val_loader = DataLoader(val_dataset, batch_size=64)

# CNN 모델 정의 (weights를 사용하여 미리 학습된 가중치를 로드)
model = models.resnet18()
num_ftrs = model.fc.in_features
model.fc = nn.Linear(num_ftrs, len(fish_dataset.classes))
model.to(device)

# 손실 함수 및 옵티마이저 정의
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=1e-3)

# 학습
num_epochs = 10
for epoch in range(num_epochs):
    model.train()
    for inputs, labels in train_loader:
        inputs, labels = inputs.to(device), labels.to(device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

    # 검증
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for inputs, labels in val_loader:
            inputs, labels = inputs.to(device), labels.to(device)
            outputs = model(inputs)
            _, predicted = torch.max(outputs.data, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    accuracy = correct / total
    print(f'Epoch [{epoch+1}/{num_epochs}], Accuracy: {accuracy:.4f}')

# 학습이 완료된 모델을 사용하여 물고기 어종을 예측할 수 있습니다.
    
torch.save({'epoch': epoch + 1,
            'state_dict': netG.state_dict()},
            'model/netG_streetview.pth')
