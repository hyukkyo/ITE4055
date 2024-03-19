import { Body, Controller, Delete, Get, Param, Patch, Post, Query } from '@nestjs/common';
import { ImagesService } from './images.service';
import { Image } from './entities/images.entity';
import { CreateImageDTO } from './dto/create-image.dto';

@Controller('images')
export class ImagesController {

    constructor(private readonly imagesService: ImagesService) {}

    @Get()
    getAll() : Image[] {
        return this.imagesService.getAll();
    }

    
    @Get(':id')
    getOne(@Param('id') imageId: number):Image {
        return this.imagesService.getOne(imageId);
    }

    @Post()
    create(@Body() imageData: CreateImageDTO) {
        return this.imagesService.create(imageData);
    }

    @Delete(':id')
    remove(@Param('id') imageId: number) {
        return this.imagesService.deleteOne(imageId);
    }
    
    // @Put()은 모든 자료를 업데이트, @Patch는 일부를 수정
    @Patch(':id')
    patch(@Param('id') imageId: number, @Body() updateData) {
        return this.imagesService.update(imageId, updateData);
    }


}
