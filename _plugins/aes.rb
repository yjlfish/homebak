require 'openssl'
require 'base64'
ALG = 'DES-EDE3-CBC'
KEY = "mZ4Wjs6L"
DES_KEY = "nZ4wJs6L"
AES_KEY="mZ4Wjs6L"
module Jekyll
  module AssetFilter

    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end



    def desencode(input)
       des = OpenSSL::Cipher::Cipher.new(ALG)
       des.pkcs5_keyivgen(KEY, DES_KEY)
       des.encrypt
       cipher = des.update(input)
       cipher << des.final
       return Base64.strict_encode64(cipher)
     end

     def desdecode(input)
         str = Base64.decode64(input)
         des = OpenSSL::Cipher::Cipher.new(ALG)
         des.pkcs5_keyivgen(KEY, DES_KEY)
         des.decrypt
         des.update(str) + des.final
      end


      def aesencode(input)
          aes = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
          aes.encrypt
          aes.key =  'abcdabcdabcdabcdabcdabcdabcdabcd'
          aes.iv = "ABCDEF1234123412"
          strr= aes.update(input.to_s.strip) + aes.final
          return Base64.strict_encode64(strr)
      end

     def aesdecode(input)
              base64_decoded = Base64.decode64(input.to_s.strip)
              aes = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
              aes.decrypt
              aes.key =  'abcdabcdabcdabcdabcdabcdabcdabcd'
              aes.iv = "ABCDEF1234123412"
              aes.update(base64_decoded) + aes.final
      end

      def encodersa(input)
          public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDU8euR2Wvhno0wy4YsL9fXuWs8\n/7WcwcD1phyA1iueT7fZcO497pAhfGvFNxY5/wIdfUTMg8mpMBAxMV5ZJFjiBjDz\nW10ta1y1dIVd+tJvIeE4txsJUgsVX87e07gGEwt5J//RL51XyIrOKi4gWjvpjb6G\nc1mzNTK8nPlmIV80QQIDAQAB\n"
          public_key =OpenSSL::PKey::RSA.new(Base64.decode64(public_key))
          secret = public_key.public_encrypt(input)
          secret = Base64.strict_encode64(secret)
          return secret
      end

      def decodersa(input)
          private_key = "MIICXQIBAAKBgQDU8euR2Wvhno0wy4YsL9fXuWs8/7WcwcD1phyA1iueT7fZcO49\n7pAhfGvFNxY5/wIdfUTMg8mpMBAxMV5ZJFjiBjDzW10ta1y1dIVd+tJvIeE4txsJ\nUgsVX87e07gGEwt5J//RL51XyIrOKi4gWjvpjb6Gc1mzNTK8nPlmIV80QQIDAQAB\nAoGAEJgFhmkN+hfz4rCJdRoJVNszGx7GFUAX/EyEfhmybnTB2+Tr+9GCU8mxUD35\nsm1HyeqAGPvQFCoVqO+y7Xlin530V0qXxZJ7bXq0xigoDPpQz/9W3oJvrm2tGmg6\nXk4W2Zhaz2jcsbHsvhAUryls9ZgsQ/m0/nRPwLs9WSZh6E0CQQD0irk1YSEcSWRo\nbHDcdtjeQPbCPRe7w2rFcKNZZ9TYuWz/TMH+4KLxougZigqrOHIzBc15dVdsLH9D\nM4hGPrJPAkEA3uwxR3dnLUooYyfe/HYY+kzhWogiJSIT5wlDLkgLglh6x5UlKZ0l\n/u+Ext3E33sEzpKeT0948arOKzNgDMzcbwJBAK+QZNWg7Q+M1Wxu5jwxixNNmprr\nF33zF1W2v1+xvsr1nP5RUjm1duZ6KZ4kT/KLLNnawaEAkIoWDCvn9F9SJdsCQGPK\nBVFBkQ1ECgpA+d+3mfzJ14MoN2i59YDRs6IPHB/QLb4T9JvJPg39+EjxU0TbE87I\n8Vb9c11zIXFTQSbZub8CQQC6Hpqp60oDPvwlgjZVTsGO5PWqHoqHorBQG7+rdaTD\nZhmTAj8r30KN2zqDH5OJKbCFA/cC4pWbFVphWAnxfXZ1\n"
          private_key = OpenSSL::PKey::RSA.new(Base64.decode64(private_key))
          secret = Base64.decode64(input)
          data = private_key.private_decrypt(secret)
          data.force_encoding('utf-8')
          return data
      end

  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)