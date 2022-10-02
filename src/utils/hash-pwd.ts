import * as crypto from 'crypto';

export const hashPwd = (p: string): string => {
  const hmac = crypto.createHmac('sha512', 'asmdfgjwer8273y9*%^&Taksjhfdi44c8 23r94s654f5s49238wf439&*&6',);
  hmac.update(p);
  return hmac.digest('hex');
}