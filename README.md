# Script de Backup Automático

Este repositório contém um script em **Shell Script** para realizar backups de diretórios locais em dispositivos externos (pendrive, HD externo, etc).  
O script gera um arquivo `.tar.gz` com a data e hora no nome, além de registrar logs no sistema.

---

## Funcionalidades

- Detecta automaticamente o último dispositivo montado em `/media` ou `/run/media`.
- Cria backups compactados (`.tar.gz`) com data/hora no nome.
- Registra logs em `/var/log/info-backup.log`.
- Gera mensagens de sucesso ou erro.
