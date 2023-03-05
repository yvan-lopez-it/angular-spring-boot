package com.bolsadeideas.springboot.backend.apirest.auth;

public class JwtConfig {

    public static final String LLAVE_SECRETA = "alguna.clave.secreta.12345678";

    public static final String RSA_PRIVADA = "-----BEGIN RSA PRIVATE KEY-----\n"
        + "MIIEogIBAAKCAQEArQwhMQGI9+iz5boVsKi16G5bcnIrPzC37nRwMIinDbDl6cJ5\n"
        + "MkaI5P6YqTDwqGIiuFZYU3J9xXm0+Aty5bIyoAxRPObGA4u/oI9IhueMnThk3xoJ\n"
        + "hNL+Eax7KnNTa4Vf6WUh22tVTsPZj+oOPA+pkkb2SLeF31wJlYdl7ug8aArY3Ium\n"
        + "c9TNsHDqR5nWo+/w1qH1inJu4TwBpbb6+xMQDl0rZB7PNfeB7wXeOjFg0RIaTljr\n"
        + "VUJQkOKjV43JECMW/mswsi14aiCQlij7yrSSQeyLp9j321CC2fUd6zfN09UXcu4f\n"
        + "m/n7nfP0RPr724YVWnihvuspD2U6N05W9gxykQIDAQABAoIBAG0kpF6bYD80VxrC\n"
        + "tmF411rlF+pkFeDCIpBUgloqJmsdMrWwQe6yzC7aYYD87BzX4JwxYX4oTSlbLQfx\n"
        + "eKNlNEb73dUynJup7dAf7xefPXIAGqcYbf6HcVXGWtyYZnn/YlH7xlH1LZYDMtpx\n"
        + "Pk8ldcdb2IRetCH/k8/q2SDI+yiG/QCBG1BjK5UV9s6BBahgRcXoJmMLWK75i7ex\n"
        + "gBe6VdAXcylEUufVe+WTpXsGRiCCHxOgVLWwgOp9H/PU4clFJ7b3o+bO/ttqZvhC\n"
        + "tPFmzSy7IBZWZbYjNQNCxdS7PGUBenOh4/gKz3veuocmoKaXkOE7wdA0IvwPLkci\n"
        + "QRPsRv0CgYEA3kWj0xlpeWCrnMh63R3xwE1Lb1v9tuhEPdbXlEKvOTHVbxwKfXB3\n"
        + "w74aeo5/PedOjfbGzW1gSMayuEtC0FY5qcYWxHp4wqy8mmiO8gbU8TshvemcRVDk\n"
        + "24Sz/Rgk7eXzaL8bsgyXde8B+sEXwuwOaitCR78ly3rKEObTEd464KcCgYEAx05Q\n"
        + "MKPJy8EEmudZXTbnqeSfGgITj1LskCeNm5D3jWTWPxE0KHk9Dh8V6xoBltpgz58W\n"
        + "pSepAtwnWAm3rCt/TffH8OGoJuhLyWvXFZAMs0TJBv9OnUUE2A2EzUSA6p4LZ2LK\n"
        + "/gaAfpgScZRHwNVnm0ZrvM0RFWo7A7gXlMy5AgcCgYABL+IGGJalnUyNU8zELYrC\n"
        + "+iay+4zJU0g6BFG2avzAk3GOXFn5/YXGN9ewW952GCwlOfIp2rGu8dC2h0BeGHfK\n"
        + "XlJ0ziqi74U6VeCdjkfI2gX+G6dH/3yZZ4YGjgB0fMvl/U9KjiKo8JPUIP/dfKE/\n"
        + "E+gQtgafpZI6sODjsYoi9QKBgDtuv/zxKqDm6w+iQ4THdae09DjWO6z2pnKKSPEF\n"
        + "9rwkQLtHzwzusmU+odOcyrKIZmwjXaZcQEsJCXZ4V1wxEGJYrDfJotIPXWIwFVBp\n"
        + "x0/CCExc372IMlyXE23+qo7MGEx5Kl075R9bC8zw0cDQIngsNL51TE3dgsGmKOoH\n"
        + "bngLAoGAQXjuBzMq2MdDwCh+25yKbx8ReqNbNr76pDzDVc8fPNxxd+Q9WPhjyHUs\n"
        + "gEvWGw3gXklvtY5R9HZ3puXtQpc7znCBLZPz9GYRZOpUjtr1auq17h1lVJpCBGCY\n"
        + "4q4IzDx32FyAAggDC/f6j/wiB2U29ZInH1xOCeVUSrWibN4WeWg=\n"
        + "-----END RSA PRIVATE KEY-----";

    public static final String RSA_PUBLICA = "-----BEGIN PUBLIC KEY-----\n"
        + "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArQwhMQGI9+iz5boVsKi1\n"
        + "6G5bcnIrPzC37nRwMIinDbDl6cJ5MkaI5P6YqTDwqGIiuFZYU3J9xXm0+Aty5bIy\n"
        + "oAxRPObGA4u/oI9IhueMnThk3xoJhNL+Eax7KnNTa4Vf6WUh22tVTsPZj+oOPA+p\n"
        + "kkb2SLeF31wJlYdl7ug8aArY3Iumc9TNsHDqR5nWo+/w1qH1inJu4TwBpbb6+xMQ\n"
        + "Dl0rZB7PNfeB7wXeOjFg0RIaTljrVUJQkOKjV43JECMW/mswsi14aiCQlij7yrSS\n"
        + "QeyLp9j321CC2fUd6zfN09UXcu4fm/n7nfP0RPr724YVWnihvuspD2U6N05W9gxy\n"
        + "kQIDAQAB\n"
        + "-----END PUBLIC KEY-----";
}
