
# ENCRYPT FUNCTION
function RijndealEncryptionPS {
    param ([Byte[]] $buffer)
    $rijndeal = [System.Security.Cryptography.RijndaelManaged]::new()
    $rijndeal.IV = (1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7)
    $rijndeal.Key = (7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1)
    return $rijndeal.CreateEncryptor().TransformFinalBlock($buffer, 0, $buffer.Length)
}

# DECRYPT FUNCTION
function RijndealDecryprionPS {
    param ([Byte[]] $buffer)
    $rijndeal = [System.Security.Cryptography.RijndaelManaged]::new()
    $rijndeal.IV = (1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4, 5, 6, 7)
    $rijndeal.Key = (7, 6, 5, 4, 3, 2, 1, 9, 8, 7, 6, 5, 4, 3, 2, 1)
    return $rijndeal.CreateDecryptor().TransformFinalBlock($buffer, 0, $buffer.Length)
}

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# For <ENCRYPT> file as a BYTE
$file = [IO.File]::ReadAllBytes('PATH TO FILE')
$encrypt = RijndealEncryptionPS $file
Write-Host $encrypt
[IO.File]::WriteAllBytes('PATH TO WRITE FILE', $encrypt)

# For <DECRYPT> file as a <BYTE>
$file2 = [IO.File]::ReadAllBytes('PATH TO FILE')
$decrypt = RijndealDecryprionPS $file2
Write-Host $decrypt
[IO.File]::WriteAllBytes('PATH TO WRITE FILE', $decrypt)