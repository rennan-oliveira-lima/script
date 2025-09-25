 #!/usr/bin/env sh

# Diretório do backup, podemos alterar para algun diretorio especifico
backup_path="/home/rennan/Documentos/scripts"

# Detectar automaticamente o último dispositivo montado em /media ou /run/media
external_storage=$(mount | grep -E "/media|/run/media" | awk '{print $3}' | tail -n 1)

# Formato do arquivo do backup, vai salvar com data e hora em formato tar.gz
date_format=$(date "+%d-%m-%Y_%H-%M-%S")
final_archive="backup-$date_format.tar.gz"

# Log no diretório do usuário, arquivo é criado caso não exista.
log_file="/var/log/info-backup.log"

# Verificar se encontrou algum dispositivo montado.
if [ -z "$external_storage" ]; then
    printf "[$date_format] Nenhum dispositivo externo montado em /media ou /run/media.\n" >> "$log_file"
    exit 1
fi

# Inicia o backup, registra no arquivo de log, dando certo ou dando algo de errado.
if tar -czf "$external_storage/$final_archive" "$backup_path"; then
    printf "[$date_format] Backup concluído com sucesso! Arquivo salvo em: %s/%s\n" "$external_storage" "$final_archive" >> "$log_file"
else
    printf "[$date_format] Erro ao realizar o backup!\n" >> "$log_file"
fi
