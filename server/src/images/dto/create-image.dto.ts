import { IsString } from "class-validator";

export class CreateImageDTO {

    @IsString()
    readonly name: string;
    @IsString()
    readonly type: string;
}