import jwt from 'jsonwebtoken'
import dotenv from 'dotenv' //veja como fazer essa importação na página de "Variáveis de ambiente (ENV)"
import { Roles } from '../types'

dotenv.config()

export interface TokenPayload{
    id:string,
    name:string,
    role:Roles
}

export class TokenManager{
    public createToken = (payload:TokenPayload):string =>{
        const token = jwt.sign(
            payload,
            process.env.JWT_KEY as string,
            {
                expiresIn: process.env.JWT_EXPIRES_IN
            }
        )
        return token
    }
    public getPyaload = (token:string):TokenPayload | null =>{
        try {
            const payload= jwt.verify(
                token,
                process.env.JWT_KEY as string
            )
            return payload as TokenPayload
            
        } catch (error) {
            return null
        }
    }
    
}