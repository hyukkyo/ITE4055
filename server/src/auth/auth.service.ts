import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { LoginRequest } from './dto/login.request';
import { TokenResponse } from './dto/token.response';
import axios from 'axios';

@Injectable()
export class AuthService {
    constructor(
        private readonly configService: ConfigService,
        private readonly jwtService: JwtService
    ) {}

    async login(data: LoginRequest, res): Promise<TokenResponse> {
        let userId;
        // switch(data.vendor) {
        //     case 'kakao': {
        //         userId = await this.getUserByKakaoAccessToken(data.accessToken);
        //         break;
        //     }
        //     default: {
        //         throw new InvalidVendorNameException(); // 소셜로그인 선택 실패 예외처리
        //     }
        // }
        userId = await this.getUserByKakaoAccessToken(data.accessToken);

        const [accessToken, refreshToken] = await Promise.all([
            this.generateAccessToken(userId),
            this.generateRefreshToken(userId),
        ]);

        res.cookie('refresh_token', refreshToken, {
            path: '/auth',
            httpOnly: true
        });

        return new TokenResponse({ accessToken });
    }


    async getUserByKakaoAccessToken(accessToken: string): Promise<string> {
        // KAKAO LOGIN 회원조회 REST-API
        const user = await axios.get('https://kaip.kakao.com/v2/user/me', {
            headers: { Authorization: `Bearer ${accessToken}`}
        });
        // if (!user) throw new KakaoOAuthFailedException(); //카카오 로그인 실패 예외처리
    
        const userId = await this.userService.findById(user.data.id);
        if (!userId) return this.userService.createUser(user.data); // 회원이 없으면 회원가입 후 아이디 반환
    
        return userId.id; // 회원이 이미 있다면 있는 유저의 아이디 반환
    }

    protected async generateAccessToken(userId: string): Promise<string> {
        return this.jwtService.signAsync(
            { user_id: userId },
            {
                expiresIn: '1h',
                subject: 'ACCESS',
            },
        );

    }
    protected async generateRefreshToken(userId: string): Promise<string> {
        return this.jwtService.signAsync(
            { user_id: userId },
            {
                expiresIn: '2w',
                subject: 'REFRESH',
            },
        );
    }
}
