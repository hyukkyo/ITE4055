# 이미지 예측 함수 정의
def predict_fish(image_path, model, transform):
    img = Image.open(image_path).convert("RGB")
    img = transform(img)
    img = img.unsqueeze(0)
    model.eval()
    with torch.no_grad():
        img = img.to(device)
        output = model(img)
    _, predicted_idx = torch.max(output, 1)
    predicted_class = dataset.classes[predicted_idx.item()]
    return predicted_class

# 이미지 파일 경로 설정
image_path = r"C:\Users\hyukkyo\ITE4055\server\test.png"

# 예측 수행
predicted_class = predict_fish(image_path, model, transform)
print(f"Predicted Fish Class: {predicted_class}")