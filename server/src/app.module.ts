import { Module } from '@nestjs/common';
import { ImagesController } from './images/images.controller';
import { ImagesService } from './images/images.service';
import { ImagesModule } from './images/images.module';
import { AppController } from './app/app.controller';

@Module({
  imports: [ImagesModule],
  controllers: [ImagesController, AppController],
  providers: [ImagesService],
})
export class AppModule {}
