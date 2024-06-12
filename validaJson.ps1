# Defina o nome do arquivo
$fileName = "exemplo1.json"

# Obtenha o caminho do diretório do script
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Combine o diretório do script com o nome do arquivo JSON
$filePath = Join-Path -Path $scriptDirectory -ChildPath $fileName

# Imprima o nome do arquivo que está sendo procurado
Write-Host "Tentando encontrar o arquivo: $fileName"

if (Test-Path -Path $filePath) {
    try {
        $json = Get-Content -Path $filePath -Raw -Encoding UTF8 | ConvertFrom-Json
        Write-Host "O arquivo JSON � v�lido."
    }
    catch {
        Write-Host "O arquivo JSON � inv�lido."
    }
} else {
    Write-Host "O arquivo JSON n�o foi encontrado no caminho especificado."
}

# Pausa para evitar que a janela feche imediatamente
Read-Host -Prompt "Pressione Enter para fechar"
