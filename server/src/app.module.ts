import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthenticationModule } from './authentication/authentication.module';
import { AuthModule } from './auth/auth.module';
import { ImageModule } from './image/image.module';
import { UserService } from './user/user.service';
import { UserModule } from './user/user.module';
import { ImageModule } from './image/image.module';

@Module({
  imports: [AuthenticationModule, AuthModule, ImageModule, UserModule],
  controllers: [AppController],
  providers: [AppService, UserService],
})
export class AppModule {}
