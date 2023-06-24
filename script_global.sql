--Essa linha cria a tabela usuarios.

CREATE TABLE usuarios (

                id_usuario              NUMERIC(9)      NOT NULL,
                email                   VARCHAR(255)    NOT NULL,
                nome                    VARCHAR(255)    NOT NULL,
                area_conhecimento       VARCHAR(38)     NOT NULL,
                senha                   VARCHAR(100)    NOT NULL
    
);

--Essa linha comenta a tabela usuarios.
COMMENT ON TABLE    usuarios                    IS  'Essa tabela guarda as informações dos usuários.';

/*Comentários da tabela usuarios.*/
COMMENT ON COLUMN   usuarios.id_usuario         IS  'Essa coluna guarda o número de identificação do usuário.';
COMMENT ON COLUMN   usuarios.email              IS  'Essa coluna guarda o endereço de email dos usuários.';
COMMENT ON COLUMN   usuarios.nome               IS  'Essa coluna guarda o nome dos usuários.';
COMMENT ON COLUMN   usuarios.area_conhecimento  IS  'Essa coluna guarda a área de conhecimento do usuário.';
COMMENT ON COLUMN   usuarios.senha              IS  'Essa coluna guarda a senha do usuário.';

--Essa linha cria a tabela coordenadores.

CREATE TABLE coordenadores (

                id_usuario          NUMERIC(9)    NOT NULL
    
);

--Essa linha comenta a tabela coordenadores.
COMMENT ON TABLE    coordenadores              IS   'Essa tabela guarda as informações dos coordenadores.';

--Comentário da tabela coordenadores.
COMMENT ON COLUMN   coordenadores.id_usuario   IS   'Essa coluna guarda o número de identificação do usuário.';

--Essa linha cria a tabela alunos.

CREATE TABLE alunos (

                id_usuario  NUMERIC(9)      NOT NULL,
                turma       VARCHAR(5)      NOT NULL,
                curso       VARCHAR(255)    NOT NULL,
                matricula   NUMERIC(9)      NOT NULL
    
);

--Essa linha comenta a tabela alunos.
COMMENT ON TABLE    alunos              IS   'Essa tabela guarda as informações dos alunos.';

/*Comentários da tabela alunos.*/
COMMENT ON COLUMN   alunos.id_usuario   IS   'Essa coluna guarda o número de identificação do usuário.';
COMMENT ON COLUMN   alunos.turma        IS   'Essa coluna guarda as informações da turma.';
COMMENT ON COLUMN   alunos.curso        IS   'Essa coluna guarda o nome do curso de cada aluno.';
COMMENT ON COLUMN   alunos.matricula    IS   'Essa coluna guarda o numero de matrícula dos alunos.';

--Essa linha cria a tabela atividades.

CREATE TABLE atividades (

                id_atividade        NUMERIC(9)      NOT NULL,
                id_usuario          NUMERIC(9)      NOT NULL,
                titulo              VARCHAR(255)    NOT NULL,
                descricao           VARCHAR(255)    NOT NULL,
                data_realizacao     DATE            NOT NULL,
                carga_horaria       INTERVAL        NOT NULL,
                status              VARCHAR(9)      NOT NULL,
                data_envio          DATE            NOT NULL,
                certificado         VARCHAR         NOT NULL
    
);

--Essa linha comenta a tabela atividades.
COMMENT ON TABLE    atividades                  IS  'Essa tabela guarda as informações das atividades.';

/*Comtentários da tebela atividades.*/
COMMENT ON COLUMN   atividades.id_atividade     IS  'Essa coluna guarda o número de identificação da atividade.';
COMMENT ON COLUMN   atividades.id_usuario       IS  'Essa coluna guarda o número de identificação do usuário.';
COMMENT ON COLUMN   atividades.titulo           IS  'Essa coluna guarda o título da atividade.';
COMMENT ON COLUMN   atividades.descricao        IS  'Essa coluna guarda a descrição da atividade.';
COMMENT ON COLUMN   atividades.data_realizacao  IS  'Essa coluna guarda a data de realização da atividade.';
COMMENT ON COLUMN   atividades.carga_horaria    IS  'Essa coluna guarda a carga horária da atividade em horas.';
COMMENT ON COLUMN   atividades.status           IS  'Essa coluna guarda a informação do status em que a atividade se encontra.';
COMMENT ON COLUMN   atividades.data_envio       IS  'Essa coluna guarda a data de envio da atividade.';
COMMENT ON COLUMN   atividades.certificado      IS  'Essa coluna guarda a url do arquivo do certificado.';

--Essa linha cria a tabela historico_de_validacoes.

CREATE TABLE historico_de_validacoes (

                id_validacao        NUMERIC(9)      NOT NULL,
                id_atividade        NUMERIC(9)      NOT NULL,
                id_usuario          NUMERIC(9)      NOT NULL,
                motivo_reprovacao   VARCHAR(255)            

);

--Essa linha comenta a tabela historico_de_validacoes.
COMMENT ON TABLE    historico_de_validacoes                     IS   'Essa tabela guarda as informações do histórico de validações das atividades.';

/*Comentários da tabela his_de_valid.*/
COMMENT ON COLUMN   historico_de_validacoes.id_validacao        IS   'Essa coluna guarda o número de identificação do protocolo de validação.';
COMMENT ON COLUMN   historico_de_validacoes.id_atividade        IS   'Essa coluna guarda o número de identificação da atividade.';
COMMENT ON COLUMN   historico_de_validacoes.id_usuario          IS   'Essa coluna guarda o número de identificação do usuário.';
COMMENT ON COLUMN   historico_de_validacoes.motivo_reprovacao   IS   'Essa coluna guarda o motivo caso a reprovação.';



---- Criar as chaves primárias


-- Cria a chave primária (PK) da tabela usuarios contendo a coluna id_usuario.
ALTER TABLE     usuarios
ADD CONSTRAINT  pk_usuarios
PRIMARY KEY     (id_usuario);

-- Cria a chave primária (PK) da tabela coordenadores contendo a coluna id_usuario.
ALTER TABLE     coordenadores
ADD CONSTRAINT  pk_coordenadores
PRIMARY KEY     (id_usuario);

-- Cria a chave primária (PK) da tabela alunos contendo a coluna id_usuario.
ALTER TABLE     alunos
ADD CONSTRAINT  pk_alunos
PRIMARY KEY     (id_usuario);

-- Cria a chave primária (PK) da tabela atividades contendo a coluna id_atividade.
ALTER TABLE     atividades
ADD CONSTRAINT  pk_atividades
PRIMARY KEY     (id_atividade);

-- Cria a chave primária (PK) da tabela historico_de_validacoes contendo a coluna id_validacao.
ALTER TABLE     historico_de_validacoes
ADD CONSTRAINT  pk_historico_de_validacoes
PRIMARY KEY     (id_validacao);



---- Criar as restrições de checagem 

-- Criar as restrições de checagem da tabela usuarios

/* Cria uma restrição de checagem para a coluna id_usuario.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     usuarios
ADD CONSTRAINT  cc_usuarios_id_usuario
CHECK           (id_usuario > 0);

/* Cria uma restrição de checagem para a coluna email.
Verificando se o e-mail inserido é valido conforme os padrões da RFC 5322. 
O padrão REGEX foi retirado da seguinte fonte: https://www.regular-expressions.info/email.html*/
ALTER TABLE     usuarios
ADD CONSTRAINT  cc_usuarios_email
CHECK           (email ~ '[a-z0-9!#$%&''*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&''*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?');

/* Cria uma restrição de checagem para a coluna area_conhecimento.
Verificando se ela está dentre os valores permitidos. */
ALTER TABLE     usuarios
ADD CONSTRAINT  cc_usuarios_area_conhecimento
CHECK           (area_conhecimento IN ('HUMANAS', 'TECNOLOGIA', 'SAÚDE'));



-- Criar as restrições de checagem da tabela coordenadores

/* Cria uma restrição de checagem para a coluna id_usuario.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     coordenadores
ADD CONSTRAINT  cc_coordenadores_id_usuario
CHECK           (id_usuario > 0);



-- Criar as restrições de checagem da tabela alunos

/* Cria uma restrição de checagem para a coluna id_usuario.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     alunos
ADD CONSTRAINT  cc_alunos_id_usuario
CHECK           (id_usuario > 0);



-- Criar as restrições de checagem da tabela atividades

/* Cria uma restrição de checagem para a coluna id_atividades.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     atividades
ADD CONSTRAINT  cc_atividades_id_atividade
CHECK           (id_atividade > 0);

/* Cria uma restrição de checagem para a coluna id_usuario.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     atividades
ADD CONSTRAINT  cc_atividades_usuario
CHECK           (id_usuario > 0);

/* Cria uma restrição de checagem para a coluna status.
Verificando se ela está dentre os valores permitidos. */
ALTER TABLE     atividades
ADD CONSTRAINT  cc_atividades_status
CHECK           (status IN ('PENDENTE', 'REPROVADO', 'APROVADO'));

/* Cria uma restrição de checagem para a coluna certificado.
Verificando se o url é valido. */
ALTER TABLE atividades
ADD CONSTRAINT cc_atividades_certificado
CHECK (certificado ~* '^https?://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$');



-- Criar as restrições de checagem da tabela historico_de_validacoes

/* Cria uma restrição de checagem para a coluna id_validacao.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     historico_de_validacoes
ADD CONSTRAINT  cc_historico_de_validacoes_id_validacao
CHECK           (id_validacao > 0);

/* Cria uma restrição de checagem para a coluna id_atividade.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     historico_de_validacoes
ADD CONSTRAINT  cc_historico_de_validacoes_id_atividade
CHECK           (id_atividade > 0);

/* Cria uma restrição de checagem para a coluna id_usuario.
Verificando se o seu valor é maior que zero. */
ALTER TABLE     historico_de_validacoes
ADD CONSTRAINT  cc_historico_de_validacoes_id_usuario
CHECK           (id_usuario > 0);



----Criar as chaves estrangeiras


--Essa linha cria uma foreign key para a tabela alunos.

ALTER TABLE alunos ADD CONSTRAINT fk_usuarios_alunos
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Essa linha cria uma foreign key para a tabela coordenadores.

ALTER TABLE coordenadores ADD CONSTRAINT fk_usuarios_coordenadores
FOREIGN KEY (id_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Essa linha cria uma foreign key para a tabela historico_de_validacoes.

ALTER TABLE historico_de_validacoes ADD CONSTRAINT fk_coordenadores_historico_de_validacoes
FOREIGN KEY (id_usuario)
REFERENCES coordenadores (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Essa linha cria uma foreign key para a tabela historico_de_validacoes.

ALTER TABLE historico_de_validacoes ADD CONSTRAINT fk_atividades_historico_de_validacoes
FOREIGN KEY (id_atividade)
REFERENCES atividades (id_atividade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Essa linha cria uma foreign key para a tabela atividades.

ALTER TABLE atividades ADD CONSTRAINT fk_alunos_atividades
FOREIGN KEY (id_usuario)
REFERENCES alunos (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;