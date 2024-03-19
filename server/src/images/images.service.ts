import { Injectable, NotFoundException } from '@nestjs/common';
import { Image } from './entities/images.entity';
import { CreateImageDTO } from './dto/create-image.dto';

@Injectable()
export class ImagesService {
    // 여기서 데이터베이스를 다룰 것
    private images: Image[] = [];

    getAll(): Image[] {
        return this.images;
    }

    getOne(id: number): Image {
        const image = this.images.find(image => image.id === id);
        if(!image) {
            throw new NotFoundException(`${id} 이미지를 찾을수없음.`);
        }
        return image;
    }

    deleteOne(id: number) {
        this.getOne(id);
        this.images = this.images.filter(image => image.id != id);
    }

    create(imageData: CreateImageDTO) {
        this.images.push({
            id: this.images.length + 1,
            ...imageData
        });
    }

    update(id: number, updateData) {
        const image = this.getOne(id);
        this.deleteOne(id);
        this.images.push({...image, ...updateData});
    }
}
