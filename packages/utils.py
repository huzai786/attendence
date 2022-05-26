from datetime import datetime
import jwt
import pickle

SECRET_KEY = "\xf9\xe4p(\xa9\x12\x1a!\x94\x8d\x1c\x99l\xc7\xb7e\xc7c\x86\x02MJ\xa0"


def encode_auth_token(data):
    try:
        payload = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1, seconds=5),
            'iat': datetime.datetime.utcnow(),
            'sub': data
        }
        
        return jwt.encode(
            payload,
            SECRET_KEY,
            algorithm='HS256'
        )

    except Exception as e:
        return e

def decode_auth_token(auth_token):
    try:
        payload = jwt.decode(auth_token, SECRET_KEY)
        return payload
    except jwt.ExpiredSignatureError:
        return 'Signature expired. Please log in again.'
    except jwt.InvalidTokenError:
        return 'Invalid token. Please log in again.'


def arry_t_byt(encoding):
    byt = pickle.dumps(encoding)
    return byt

def byt_t_arry(byte):
    array = pickle.loads(byte)
    return [array]