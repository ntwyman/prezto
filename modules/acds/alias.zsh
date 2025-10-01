alias plocal='psql -h localhost -U acds_user -d postgres'

alias tdevdb='ssh -N -L 5433:asm-db.cwjlttq8tphy.eu-west-2.rds.amazonaws.com:5432 asm:dev'
alias tdevq='ssh -N -L 8443:b-b1adf345-8cc3-44b3-afd1-c6b296ba0561.mq.eu-west-2.amazonaws.com:443  -L 5672:b-b1adf345-8cc3-44b3-afd1-c6b296ba0561.mq.eu-west-2.amazonaws.com:5671 asm:dev'
alias tdevapi='ssh -N -L 8080:internal-asm-api-lb-704307325.eu-west-2.elb.amazonaws.com:80 asm:dev'

alias tdemodb='ssh -N -L 5433:asm-db.c3wciows2b34.eu-west-2.rds.amazonaws.com:5432 asm:demo'
alias tdemoq='ssh -N -L 8443:b-63fcb45e-9f7b-4728-97f6-ac450562b111.mq.eu-west-2.amazonaws.com:443 -L 5672:b-63fcb45e-9f7b-4728-97f6-ac450562b111.mq.eu-west-2.amazonaws.com:5671 asm:demo'
alias tdemoapi='ssh -N -L 8080:internal-asm-api-lb-1367795946.eu-west-2.elb.amazonaws.com:80 asm:demo'

alias tproddb='ssh -N -L 5433:acds-db.cgs6io5w5jyv.us-west-2.rds.amazonaws.com:5432 asm:prod'
alias tprodq='ssh -N -L 8443:b-1ba0fc90-7499-4ca8-b161-af5cb370d43c.mq.us-west-2.amazonaws.com:443 -L 5672:b-1ba0fc90-7499-4ca8-b161-af5cb370d43c.mq.us-west-2.amazonaws.com:5671 asm:prod'
alias tprodapi='ssh -N -L 8080:internal-acds-api-lb-932058284.us-west-2.elb.amazonaws.com:80 asm:prod'