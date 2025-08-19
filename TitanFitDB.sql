-- Criação do banco de dados
CREATE DATABASE TitanFitDB;

-- Selecionado o banco de dados para uso
USE TitanFitDB;

-- Tabela de visitantes
CREATE TABLE Visitantes(
    ID_Visitante INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Visitante VARCHAR(30) NOT NULL,
    RG_Visitante VARCHAR(15) NOT NULL UNIQUE
);

-- Tabela das áreas da empresa
CREATE TABLE Areas(
    ID_Area INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Area VARCHAR(30)
);

-- Tabela dos cargos da empresa
CREATE TABLE Cargos(
    ID_Cargo INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Cargo VARCHAR(50),
    Acesso_Cargo INT CHECK (Acesso_Cargo >= 1 AND Acesso_Cargo <= 5) -- Níveis no controle de acesso em sistemas
);

-- Tabela dos alunos
CREATE TABLE Alunos(
    ID_Aluno INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Aluno VARCHAR(30) NOT NULL,
    CPF_Aluno VARCHAR(20) NOT NULL UNIQUE,
    RG_Aluno VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Aluno DATE NOT NULL,
    Genero_Aluno VARCHAR(15) NOT NULL,
    Email_Aluno VARCHAR(50) NOT NULL UNIQUE,
    Celular_Aluno VARCHAR(15) NOT NULL,
    CEP_Aluno VARCHAR(10) NOT NULL,
    Endereco_Aluno VARCHAR(50) NOT NULL,
    Complemento_Aluno VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Aluno VARCHAR(30) NOT NULL,
    Cidade_Aluno VARCHAR(25) NOT NULL,
    Estado_Aluno VARCHAR(25) NOT NULL,
    Matricula_Aluno INT NOT NULL UNIQUE
);

-- Tabela de instrutores que criam as séries e acompanham os alunos
CREATE TABLE Instrutores_Treinos(
    ID_Treinador INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Treinador VARCHAR(30) NOT NULL,
    CPF_Treinador VARCHAR(20) NOT NULL UNIQUE,
    RG_Treinador VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Treinador DATE NOT NULL,
    Genero_Treinador VARCHAR(15) NOT NULL,
    Email_Treinador VARCHAR(50) NOT NULL UNIQUE,
    Celular_Treinador VARCHAR(15) NOT NULL,
    CEP_Treinador VARCHAR(10) NOT NULL,
    Endereco_Treinador VARCHAR(50) NOT NULL,
    Complemento_Treinador VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Treinador VARCHAR(30) NOT NULL,
    Cidade_Treinador VARCHAR(25) NOT NULL,
    Estado_Treinador VARCHAR(25) NOT NULL,
    Matricula_Treinador INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1 -- Definições de 1 para ATIVIDADE ou 0 para INATIVIDADE sem exclusão de dados
);

-- Tabela de professores que oferecem as aulas na academia
CREATE TABLE Instrutores_Aulas(
    ID_Professor INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Professor VARCHAR(30) NOT NULL,
    CPF_Professor VARCHAR(20) NOT NULL UNIQUE,
    RG_Professor VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Professor DATE NOT NULL,
    Genero_Professor VARCHAR(15) NOT NULL,
    Email_Professor VARCHAR(50) NOT NULL UNIQUE,
    Celular_Professor VARCHAR(15) NOT NULL,
    CEP_Professor VARCHAR(10) NOT NULL,
    Endereco_Professor VARCHAR(50) NOT NULL,
    Complemento_Professor VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Professor VARCHAR(30) NOT NULL,
    Cidade_Professor VARCHAR(25) NOT NULL,
    Estado_Professor VARCHAR(25) NOT NULL,
    Matricula_Professor INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela de instrutores particulares
CREATE TABLE Personal_Trainers(
    ID_Personal INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Personal VARCHAR(30) NOT NULL,
    CPF_Personal VARCHAR(20) NOT NULL UNIQUE,
    RG_Personal VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Personal DATE NOT NULL,
    Genero_Personal VARCHAR(15) NOT NULL,
    Email_Personal VARCHAR(50) NOT NULL UNIQUE,
    Celular_Personal VARCHAR(15) NOT NULL,
    CEP_Personal VARCHAR(10) NOT NULL,
    Endereco_Personal VARCHAR(50) NOT NULL,
    Complemento_Personal VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Personal VARCHAR(30) NOT NULL,
    Cidade_Personal VARCHAR(25) NOT NULL,
    Estado_Personal VARCHAR(25) NOT NULL,
    Matricula_Personal INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela de nutricionistas ou fisioterapeutas que avaliam os alunos
CREATE TABLE Avaliadores_Fisicos(
    ID_Avaliador INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Avaliador VARCHAR(30) NOT NULL,
    CPF_Avaliador VARCHAR(20) NOT NULL UNIQUE,
    RG_Avaliador VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Avaliador DATE NOT NULL,
    Genero_Avaliador VARCHAR(15) NOT NULL,
    Email_Avaliador VARCHAR(50) NOT NULL UNIQUE,
    Celular_Avaliador VARCHAR(15) NOT NULL,
    CEP_Avaliador VARCHAR(10) NOT NULL,
    Endereco_Avaliador VARCHAR(50) NOT NULL,
    Complemento_Avaliador VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Avaliador VARCHAR(30) NOT NULL,
    Cidade_Avaliador VARCHAR(25) NOT NULL,
    Estado_Avaliador VARCHAR(25) NOT NULL,
    Matricula_Avaliador INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela de estagiários da academia
CREATE TABLE Estagiarios(
    ID_Estagiario INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Estagiario VARCHAR(30) NOT NULL,
    CPF_Estagiario VARCHAR(20) NOT NULL UNIQUE,
    RG_Estagiario VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Estagiario DATE NOT NULL,
    Genero_Estagiario VARCHAR(15) NOT NULL,
    Email_Estagiario VARCHAR(50) NOT NULL UNIQUE,
    Celular_Estagiario VARCHAR(15) NOT NULL,
    CEP_Estagiario VARCHAR(10) NOT NULL,
    Endereco_Estagiario VARCHAR(50) NOT NULL,
    Complemento_Estagiario VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Estagiario VARCHAR(30) NOT NULL,
    Cidade_Estagiario VARCHAR(25) NOT NULL,
    Estado_Estagiario VARCHAR(25) NOT NULL,
    Matricula_Estagiario INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela do cálculo das despesas e lucro da academia
CREATE TABLE Lucros(
    ID_Lucro INT IDENTITY(1,1) PRIMARY KEY,
    Materiais_Despesa DECIMAL(10,2) NOT NULL,
    Equipamentos_Despesa DECIMAL(10,2) NOT NULL,
    Dispositivos_Despesa DECIMAL(10,2) NOT NULL,
    Funcionarios_Despesa DECIMAL(10,2) NOT NULL,
    Manutencoes_Despesa DECIMAL(10,2) NOT NULL,
    Aluguel_Despesa DECIMAL(10,2) NOT NULL,
    Contas_Despesa DECIMAL(10,2) NOT NULL,
    Planos_Lucro DECIMAL(10,2) NOT NULL,
    Lucro_Total AS Planos_Lucro - (Materiais_Despesa + Equipamentos_Despesa + Dispositivos_Despesa + Funcionarios_Despesa + Manutencoes_Despesa + Aluguel_Despesa + Contas_Despesa) PERSISTED, -- Salva esse valor importante para a academia no disco rígido
    Data_Lucro DATE NOT NULL
);

-- Tabela do setor de serviços gerais
CREATE TABLE Profissionais_Manutencao(
    ID_Manutentor INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Manutentor VARCHAR(30) NOT NULL,
    CPF_Manutentor VARCHAR(20) NOT NULL UNIQUE,
    RG_Manutentor VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Manutentor DATE NOT NULL,
    Genero_Manutentor VARCHAR(15) NOT NULL,
    Email_Manutentor VARCHAR(50) NOT NULL UNIQUE,
    Celular_Manutentor VARCHAR(15) NOT NULL,
    CEP_Manutentor VARCHAR(10) NOT NULL,
    Endereco_Manutentor VARCHAR(50) NOT NULL,
    Complemento_Manutentor VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Manutentor VARCHAR(30) NOT NULL,
    Cidade_Manutentor VARCHAR(25) NOT NULL,
    Estado_Manutentor VARCHAR(25) NOT NULL,
    Matricula_Manutentor INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela dos setor que controla as finanças
CREATE TABLE Profissionais_Financeiro(
    ID_Financeiro INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Financeiro VARCHAR(30) NOT NULL,
    CPF_Financeiro VARCHAR(20) NOT NULL UNIQUE,
    RG_Financeiro VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Financeiro DATE NOT NULL,
    Genero_Financeiro VARCHAR(15) NOT NULL,
    Email_Financeiro VARCHAR(50) NOT NULL UNIQUE,
    Celular_Financeiro VARCHAR(15) NOT NULL,
    CEP_Financeiro VARCHAR(10) NOT NULL,
    Endereco_Financeiro VARCHAR(50) NOT NULL,
    Complemento_Financeiro VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Financeiro VARCHAR(30) NOT NULL,
    Cidade_Financeiro VARCHAR(25) NOT NULL,
    Estado_Financeiro VARCHAR(25) NOT NULL,
    Matricula_Financeiro INT NOT NULL UNIQUE,
    ID_Lucro INT,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Lucro) REFERENCES Lucros(ID_Lucro),
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela das modalidades de pagamentos
CREATE TABLE Modalidades_Pagamentos(
    ID_Modalidade INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Modalidade VARCHAR(10) NOT NULL,
    Desconto_Modalidade DECIMAL(5,2) DEFAULT 0.00
);

-- Tabela de exercícios executados pelos alunos
CREATE TABLE Treinos(
    ID_Treino INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Treino VARCHAR(50) NOT NULL,
    Repeticoes_Treino VARCHAR(35) NOT NULL,
    Carga_Treino VARCHAR(20) NOT NULL,
    Descanso_Treino VARCHAR(10) NOT NULL,
    ID_Aluno INT,
    FOREIGN KEY(ID_Aluno) REFERENCES Alunos(ID_Aluno)
);

-- Tabela de equipamentos utilizados
-- Site https://www.lojakonnen.com.br/
CREATE TABLE Equipamentos(
    ID_Equipamento INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Equipamento VARCHAR(30) NOT NULL,
    Descricao_Equipamento VARCHAR(100) NOT NULL,
    Marca_Equipamento VARCHAR(25) NOT NULL,
    Valor_Equipamento DECIMAL(10,2) NOT NULL,
    Quantidade_Equipamento INT NOT NULL
);

-- Tabela de setor que controla as matrículas e contato com público
CREATE TABLE Profissionais_Atendimento(
    ID_Atendimento INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Atendimento VARCHAR(30) NOT NULL,
    CPF_Atendimento VARCHAR(20) NOT NULL UNIQUE,
    RG_Atendimento VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_Atendimento DATE NOT NULL,
    Genero_Atendimento VARCHAR(15) NOT NULL,
    Email_Atendimento VARCHAR(50) NOT NULL UNIQUE,
    Celular_Atendimento VARCHAR(15) NOT NULL,
    CEP_Atendimento VARCHAR(10) NOT NULL,
    Endereco_Atendimento VARCHAR(50) NOT NULL,
    Complemento_Atendimento VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_Atendimento VARCHAR(30) NOT NULL,
    Cidade_Atendimento VARCHAR(25) NOT NULL,
    Estado_Atendimento VARCHAR(25) NOT NULL,
    Matricula_Atendimento INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela do setor que viabiliza o funcionamento tecnológico
CREATE TABLE Profissionais_Tecnologia(
    ID_TI INT IDENTITY(1,1) PRIMARY KEY,
    Nome_TI VARCHAR(30) NOT NULL,
    CPF_TI VARCHAR(20) NOT NULL UNIQUE,
    RG_TI VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_TI DATE NOT NULL,
    Genero_TI VARCHAR(15) NOT NULL,
    Email_TI VARCHAR(50) NOT NULL UNIQUE,
    Celular_TI VARCHAR(15) NOT NULL,
    CEP_TI VARCHAR(10) NOT NULL,
    Endereco_TI VARCHAR(50) NOT NULL,
    Complemento_TI VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_TI VARCHAR(30) NOT NULL,
    Cidade_TI VARCHAR(25) NOT NULL,
    Estado_TI VARCHAR(25) NOT NULL,
    Matricula_TI INT NOT NULL UNIQUE,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela de dispositivos utilizados na academia
CREATE TABLE Dispositivos(
    ID_Dispositivo INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Dispositivo VARCHAR(50) NOT NULL,
    Marca_Dispositivo VARCHAR(30) NOT NULL,
    Modelo_Dispositivo VARCHAR(50),
    Serie_Dispositivo VARCHAR(100) UNIQUE,
    Localizacao_Dispositivo VARCHAR(50), -- Recepção, sala do CPD etc.
    Valor_Dispositivo DECIMAL(10,2),
    Aquisicao_Dispositivo DATE DEFAULT GETDATE(),
    Status_Dispositivo VARCHAR(20) DEFAULT 'ATIVO', -- Pode ser definido como ATIVO, MANUTENÇÃO e INATIVO
    ID_TI INT, -- Profissionais de TI controlam os dispositivos
    FOREIGN KEY(ID_TI) REFERENCES Profissionais_Tecnologia(ID_TI) 
);

-- Tabela do local para armazenamento de materiais da academia
CREATE TABLE Almoxarifado(
    ID_Almoxarifado INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Material VARCHAR(50) NOT NULL,
    Quantidade_Material INT NOT NULL,
    Preco_Material DECIMAL(10,2),
    Data_Material DATE DEFAULT GETDATE(), -- Para saber quando o estoque foi atualizado
    ID_Manutentor INT, -- Profissionais de manutenção controlam os materiais
    FOREIGN KEY (ID_Manutentor) REFERENCES Profissionais_Manutencao(ID_Manutentor)
);

-- Tabela dos planos pagos pelos alunos
CREATE TABLE Planos(
    ID_Plano INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Plano VARCHAR(20) NOT NULL,
    Valor_Plano DECIMAL(10,2) NOT NULL,
    ID_Aluno INT NOT NULL,
    ID_Modalidade INT NOT NULL,
    FOREIGN KEY(ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY(ID_Modalidade) REFERENCES Modalidades_Pagamentos(ID_Modalidade)
);

-- Tabela de aulas coletivas frequentadas pelos alunos
CREATE TABLE Aulas(
    ID_Aula INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Aula VARCHAR(30) NOT NULL,
    Categoria_Aula VARCHAR(20) NOT NULL,
    Dia_Aula DATE NOT NULL,
    Horario_Aula TIME NOT NULL,
    Capacidade_Aula INT NOT NULL,
    Intensidade_Aula VARCHAR(10) NOT NULL,
    Reserva_Aula BIT DEFAULT 0,
    ID_Aluno INT,
    ID_Professor INT NOT NULL, -- NOT NULL, pois toda aula tem 1 professor
    ID_Avaliador INT,
    FOREIGN KEY(ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY(ID_Professor) REFERENCES Instrutores_Aulas(ID_Professor),
    FOREIGN KEY(ID_Avaliador) REFERENCES Avaliadores_Fisicos(ID_Avaliador)
);

-- Tabela do setor da gestão
CREATE TABLE Profissionais_Administracao(
    ID_ADM INT IDENTITY(1,1) PRIMARY KEY,
    Nome_ADM VARCHAR(30) NOT NULL,
    CPF_ADM VARCHAR(20) NOT NULL UNIQUE,
    RG_ADM VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_ADM DATE NOT NULL,
    Genero_ADM VARCHAR(15) NOT NULL,
    Email_ADM VARCHAR(50) NOT NULL UNIQUE,
    Celular_ADM VARCHAR(15) NOT NULL,
    CEP_ADM VARCHAR(10) NOT NULL,
    Endereco_ADM VARCHAR(50) NOT NULL,
    Complemento_ADM VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_ADM VARCHAR(30) NOT NULL,
    Cidade_ADM VARCHAR(25) NOT NULL,
    Estado_ADM VARCHAR(25) NOT NULL,
    Matricula_ADM INT NOT NULL UNIQUE,
    ID_Aluno INT NULL, -- Alterado para NULL
    ID_Treinador INT,
    ID_Professor INT,
    ID_Personal INT,
    ID_Avaliador INT,
    ID_Estagiario INT,
    ID_TI INT,
    ID_Aula INT NULL, -- Alterado para NULL
    ID_Lucro INT NOT NULL,
    ID_Equipamento INT NOT NULL,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY(ID_Treinador) REFERENCES Instrutores_Treinos(ID_Treinador),
    FOREIGN KEY(ID_Professor) REFERENCES Instrutores_Aulas(ID_Professor),
    FOREIGN KEY(ID_Personal) REFERENCES Personal_Trainers(ID_Personal),
    FOREIGN KEY(ID_Avaliador) REFERENCES Avaliadores_Fisicos(ID_Avaliador),
    FOREIGN KEY(ID_Estagiario) REFERENCES Estagiarios(ID_Estagiario),
    FOREIGN KEY(ID_TI) REFERENCES Profissionais_Tecnologia(ID_TI),
    FOREIGN KEY(ID_Aula) REFERENCES Aulas(ID_Aula),
    FOREIGN KEY(ID_Lucro) REFERENCES Lucros(ID_Lucro),
    FOREIGN KEY(ID_Equipamento) REFERENCES Equipamentos(ID_Equipamento),
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela do setor de contratação
CREATE TABLE Profissionais_Contratacao(
    ID_RH INT IDENTITY(1,1) PRIMARY KEY,
    Nome_RH VARCHAR(30) NOT NULL,
    CPF_RH VARCHAR(20) NOT NULL UNIQUE,
    RG_RH VARCHAR(15) NOT NULL UNIQUE,
    Nascimento_RH DATE NOT NULL,
    Genero_RH VARCHAR(15) NOT NULL,
    Email_RH VARCHAR(50) NOT NULL UNIQUE,
    Celular_RH VARCHAR(15) NOT NULL,
    CEP_RH VARCHAR(10) NOT NULL,
    Endereco_RH VARCHAR(50) NOT NULL,
    Complemento_RH VARCHAR(30), -- Pode ser NULL se não houver complemento
    Bairro_RH VARCHAR(30) NOT NULL,
    Cidade_RH VARCHAR(25) NOT NULL,
    Estado_RH VARCHAR(25) NOT NULL,
    Matricula_RH INT NOT NULL UNIQUE,
    ID_Treinador INT,
    ID_Professor INT,
    ID_Personal INT,
    ID_Avaliador INT,
    ID_Estagiario INT,
    ID_TI INT,
    ID_Financeiro INT,
    ID_Manutentor INT,
    ID_Atendimento INT,
    ID_ADM INT,
    ID_Area INT,
    ID_Cargo INT,
    FOREIGN KEY(ID_Treinador) REFERENCES Instrutores_Treinos(ID_Treinador),
    FOREIGN KEY(ID_Professor) REFERENCES Instrutores_Aulas(ID_Professor),
    FOREIGN KEY(ID_Personal) REFERENCES Personal_Trainers(ID_Personal),
    FOREIGN KEY(ID_Avaliador) REFERENCES Avaliadores_Fisicos(ID_Avaliador),
    FOREIGN KEY(ID_Estagiario) REFERENCES Estagiarios(ID_Estagiario),
    FOREIGN KEY(ID_TI) REFERENCES Profissionais_Tecnologia(ID_TI),
    FOREIGN KEY(ID_Financeiro) REFERENCES Profissionais_Financeiro(ID_Financeiro),
    FOREIGN KEY (ID_Manutentor) REFERENCES Profissionais_Manutencao(ID_Manutentor),
    FOREIGN KEY(ID_Atendimento) REFERENCES Profissionais_Atendimento(ID_Atendimento),
    FOREIGN KEY(ID_ADM) REFERENCES Profissionais_Administracao(ID_ADM),
    FOREIGN KEY(ID_Area) REFERENCES Areas(ID_Area),
    FOREIGN KEY(ID_Cargo) REFERENCES Cargos(ID_Cargo),
    ATIVO BIT DEFAULT 1
);

-- Tabela das catracas para controle e liberação de acesso 
CREATE TABLE Registros_Catraca(
    ID_Catraca INT IDENTITY(1,1) PRIMARY KEY,
    Data_Catraca DATE,
    Hora_Entrada TIME,
    Hora_Saida TIME,
    ID_Aluno INT,
    ID_Personal INT,
    ID_Estagiario INT,
    ID_Visitante INT,
    FOREIGN KEY(ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY(ID_Personal) REFERENCES Personal_Trainers(ID_Personal),
    FOREIGN KEY(ID_Estagiario) REFERENCES Estagiarios(ID_Estagiario),
    FOREIGN KEY(ID_Visitante) REFERENCES Visitantes(ID_Visitante)
);

-- Tabela do ponto para registro de horas dos funcionários
CREATE TABLE Registros_Ponto(
    ID_Ponto INT IDENTITY(1,1) PRIMARY KEY,
    Data_Ponto DATE,
    Hora_Entrada TIME,
    Hora_Saida TIME,
    ID_Treinador INT,
    ID_Professor INT,
    ID_Avaliador INT,
    ID_Estagiario INT,
    ID_TI INT,
    ID_Atendimento INT,
    ID_Financeiro INT,
    ID_Manutentor INT,
    ID_ADM INT,
    FOREIGN KEY(ID_Treinador) REFERENCES Instrutores_Treinos(ID_Treinador),
    FOREIGN KEY(ID_Professor) REFERENCES Instrutores_Aulas(ID_Professor),
    FOREIGN KEY(ID_Avaliador) REFERENCES Avaliadores_Fisicos(ID_Avaliador),
    FOREIGN KEY(ID_Estagiario) REFERENCES Estagiarios(ID_Estagiario),
    FOREIGN KEY(ID_TI) REFERENCES Profissionais_Tecnologia(ID_TI),
    FOREIGN KEY(ID_Atendimento) REFERENCES Profissionais_Atendimento(ID_Atendimento),
    FOREIGN KEY(ID_Financeiro) REFERENCES Profissionais_Financeiro(ID_Financeiro),
    FOREIGN KEY(ID_Manutentor) REFERENCES Profissionais_Manutencao(ID_Manutentor),
    FOREIGN KEY(ID_ADM) REFERENCES Profissionais_Administracao(ID_ADM)
);

-- Inserções para a tabela de visitantes
INSERT INTO Visitantes(Nome_Visitante,RG_Visitante) VALUES
('Denis Coelho','25.673.332-1'),
('Lais Barbosa','22.633.432-1'),
('Olivia Ferreira','54.846.672-1');

-- Inserções para a tabela das áreas de atuação
INSERT INTO Areas(Nome_Area) VALUES
('Diretoria'), -- 1
('Recursos Humanos'), -- 2
('Administração'), -- 3
('Financeiro'), -- 4
('Tecnologia da Informação'), -- 5
('Educação Física'), -- 6
('Nutrição'), -- 7
('Fisioterapia'), -- 8
('Elétrica'), -- 9
('Hidráulica'), -- 10
('Serviços Gerais'), -- 11
('Atendimento'); -- 12

-- Inserções para a tabela dos cargos
INSERT INTO Cargos(Nome_Cargo,Acesso_Cargo) VALUES
('Estagiário(a) de Educação Física', 1), -- 1
('Estagiário(a) de Nutrição', 1), -- 2
('Estagiário(a) de Fisioterapia', 1), -- 3
('Estagiário(a) de Administração', 1), -- 4
('Estagiário(a) de Tecnologia da Informação', 1), -- 5
('Estagiário(a) de Comunicação', 1), -- 6
('Estagiário(a) de Recursos Humanos', 1), -- 7
('Estagiário(a) de Finanças', 1), -- 8
('Professor(a) de Educação Física', 3), -- 9
('Nutricionista', 3), -- 10
('Fisioterapeuta', 3), -- 11
('Pintor(a)', 1), -- 12
('Auxiliar de Serviços Gerais',2), -- 13
('Eletricista',2), -- 14
('Encanador(a)',2), -- 15
('Consultor(a) Financeiro(a)',3), -- 16
('Compliance Financeiro(a)',5), -- 17
('Gestor(a) de Riscos',5), -- 18
('Analista de Investimentos',4), -- 19
('Teleatendimento',2), -- 20
('Analista de Fidelização',2), -- 21
('Analista de Suporte',2), -- 22
('Analista de Pós-Venda',3), -- 23
('Recepcionista',2), -- 24
('Desenvolvedor(a) de Software',3), -- 25
('Administrador(a) de Banco de Dados',3), -- 26
('Analista de Sistemas',4), -- 27
('Técnico(a) de Suporte',3), -- 28
('Analista de Segurança da Informação',4), -- 29
('Gerente Geral',5), -- 30
('Coordenador(a) de Operações',1), -- 31
('Supervisor(a) Administrativo(a)',2), -- 32
('Diretor(a) Financeiro(a)',2), -- 33
('Gerente de Vendas',2), -- 34
('Administração Pessoal',3), -- 35
('Recrutador(a)',2), -- 36
('Desenvolvedor(a) Pessoal',2), -- 37
('Diretor(a)',5); -- 38

-- Inserções para a tabela de alunos
INSERT INTO Alunos(Nome_Aluno,CPF_Aluno,RG_Aluno,Nascimento_Aluno,Genero_Aluno,Email_Aluno,Celular_Aluno,CEP_Aluno,Endereco_Aluno,Complemento_Aluno,Bairro_Aluno,Cidade_Aluno,Estado_Aluno,Matricula_Aluno) VALUES
('João Oliveira','132.984.938-44','26.398.503-4','1996-05-11','Masculino','joao.oliveira@gmail.com','(21)99852-7444','21639-582','Estreda do Galeão, 2500','Casa 546','Portuguesa','Rio de Janeiro','RJ',136510),
('Maria Santos','987.654.321-00','12.345.678-9','1998-08-20','Feminino','maria.santos@gmail.com','(21)98765-4321','22439-100','Rua da Assembléia, 100','Apto 101','Centro','Rio de Janeiro','RJ',136511),
('Pedro Silva','111.222.333-45','98.765.432-1','1995-03-15','Masculino','pedro.silva@gmail.com','(21)99123-4567','22438-212','Avenida Atlântica, 3000','Bloco A - Apto 502','Copacabana','Rio de Janeiro','RJ',136512),
('Ana Pereira','555.444.333-22','33.444.555-6','2000-11-01','Feminino','ana.pereira@gmail.com','(21)98111-2233','20550-010','Rua Conde Bonfim, 800','Casa 66','Tijuca','Rio de Janeiro','RJ',136513),
('Lucas Rodrigues','777.888.999-00','45.678.901-2','1997-01-25','Masculino','lucas.rodrigues@gmail.com','(21)99333-4455','22770-200','Avenida das Américas, 5000','Apto 1005','Barra da Tijuca','Rio de Janeiro','RJ',136514),
('Fernanda Lima','112.233.444-55','10.203.040-5','1999-07-10','Feminino','fernanda.lima@gmail.com','(21)98765-1234','20230-010','Rua do Catete, 300','Apto 202','Catete','Rio de Janeiro','RJ',136515),
('Guilherme Souza','223.344.555-66','20.304.050-6','1994-02-28','Masculino','guilherme.souza@gmail.com','(21)99876-5432','20050-001','Avenida Rio Branco, 10','Casa 120','Centro','Rio de Janeiro','RJ',136516),
('Camila Costa','334.455.666-77','30.405.060-7','2001-09-03','Feminino','camila.costa@gmail.com','(21)99111-3322','22041-001','Avenida Nossa Senhora de Copacabana, 900','Cobertura','Copacabana','Rio de Janeiro','RJ',136517),
('Rafael Martins','445.566.777-88','40.506.070-8','1996-06-19','Masculino','rafael.martins@gmail.com','(21)98222-4433','22210-060','Rua do Flamengo, 150','Bloco B - Apto 305','Flamengo','Rio de Janeiro','RJ',136518),
('Patrícia Almeida','556.677.888-99','50.607.080-9','1993-12-05','Feminino','Patricia.almeida@gmail.com','(21)99444-6655','20720-020','Rua Dias da Cruz, 400','Casa 12','Méier','Rio de Janeiro','RJ',136519),
('Daniel Gomes','667.788.999-00','60.708.090-0','1997-04-22','Masculino','daniel.gomes@gmail.com','(21)98555-7766','22631-000','Avenida Afonso Arinos de Melo, 100','Apto 801','Recreio dos Bandeirantes','Rio de Janeiro','RJ',136520),
('Juliana Silveira','778.899.000-11','70.809.010-1','2000-01-30','Feminino','juliana.silveira@gmail.com','(21)99666-8877','21040-360','Rua Carvalho de Souza, 120','Apto 208','Madureira','Rio de Janeiro','RJ',136521),
('Bruno Ferreira','889.900.111-22','80.901.020-2','1995-10-08','Masculino','bruno.ferreira@gmail.com','(21)98777-9988','20560-080','Rua São Francisco Xavier, 700','Casa 304','Tijuca','Rio de Janeiro','RJ',136522),
('Sara Rocha','990.011.222-33','90.102.030-3','1998-03-12','Feminino','sara.rocha@gmail.com','(21)99888-0099','22793-081','Avenida Salvador Allende, 200','Casa 1','Barra da Tijuca','Rio de Janeiro','RJ',136523),
('Thiago Castro','001.122.333-44','01.203.040-4','1996-09-27','Masculino','thiago.castro@gmail.com','(21)98999-1100','20090-003','Rua da Quitanda, 50','Apto 401','Centro','Rio de Janeiro','RJ',136524),
('Artur Gomes','101.202.303-44','25.876.543-1','1997-06-20','Masculino','artur.gomes@gmail.com','(21)99123-9876','20230-050','Rua da Glória, 120','Apto 10','Glória','Rio de Janeiro','RJ',136525),
('Carla Souza','102.303.404-55','26.987.654-2','1999-11-15','Feminino','carla.souza@gmail.com','(21)98765-1234','20551-010','Rua Dr. Satamini, 80','Casa 3','Tijuca','Rio de Janeiro','RJ',136526),
('André Fonseca','103.404.505-66','27.098.765-3','1995-04-01','Masculino','andre.fonseca@gmail.com','(21)99876-5432','22770-100','Avenida João Cabral de Mello Neto, 700','Bloco 2 - Apto 1201','Barra da Tijuca','Rio de Janeiro','RJ',136527),
('Cristiane Lopes','104.505.606-77','28.109.876-4','2000-08-28','Feminino','cristiane.lopes@gmail.com','(21)99111-2233','22240-004','Rua das Laranjeiras, 350','Apto 502','Laranjeiras','Rio de Janeiro','RJ',136528),
('Caio Nogueira','105.606.707-88','29.210.987-5','1998-02-10','Masculino','caio.nogueira@gmail.com','(21)98222-4433','21021-360','Avenida Brás de Pina, 2000','Casa 125','Penha','Rio de Janeiro','RJ',136529),
('Gabriela Silva','106.707.808-99','30.321.098-6','1999-01-05','Feminino','gabriela.silva@gmail.com','(21)99333-5544','22790-105','Rua Gilka Machado, 300','Apto 401','Recreio dos Bandeirantes','Rio de Janeiro','RJ',136530),
('Pedro Soares','107.808.909-00','31.432.109-7','1997-07-18','Masculino','pedro.soares@gmail.com','(21)98444-6655','20550-020','Rua Mariz e Barros, 700','Casa 10','Tijuca','Rio de Janeiro','RJ',136531),
('Larissa Fernandes','108.909.010-11','32.543.210-8','2002-03-22','Feminino','larissa.fernandes@gmail.com','(21)97555-7766','22071-002','Rua Raul Pompeia, 12','Apto 201','Copacabana','Rio de Janeiro','RJ',136532),
('Marcos Santos','109.010.111-22','33.654.321-9','1994-09-09','Masculino','marcos.santos@gmail.com','(21)96666-8877','22210-090','Praia do Flamengo, 68','Apto 901','Flamengo','Rio de Janeiro','RJ',136533),
('Beatriz Oliveira','110.111.222-33','34.765.432-0','1990-11-03','Feminino','beatriz.oliveira@gmail.com','(21)95777-9988','22420-050','Rua Barão da Torre, 302','Sala 1003','Ipanema','Rio de Janeiro','RJ',136534),
('Vinicius Costa','111.222.333-44','35.876.543-1','1993-05-29','Masculino','vinicius.costa@gmail.com','(21)94888-0099','22775-060','Avenida Ayrton Senna, 2502','Bloco 7 - Apto 301','Barra da Tijuca','Rio de Janeiro','RJ',136535),
('Amanda Lopes','112.333.444-55','36.987.654-2','1986-08-14','Feminino','amanda.lopes@gmail.com','(21)93999-1100','20230-060','Rua do Lavradio, 92','Apto 119','Lapa','Rio de Janeiro','RJ',136536),
('Felipe Santos','113.444.555-66','37.098.765-3','1991-02-07','Masculino','felipe.santos@gmail.com','(21)92000-2211','22450-210','Rua Jardim Botânico, 102','Casa 3','Jardim Botânico','Rio de Janeiro','RJ',136537),
('Caroline Silva','114.555.666-77','38.109.876-4','1996-10-10','Feminino','caroline.silva@gmail.com','(21)91111-3322','22631-460','Avenida Santa Mônica, 1002','Apto 306','Barra da Tijuca','Rio de Janeiro','RJ',136538),
('Rodrigo Oliveira','115.666.777-88','39.210.987-5','1983-04-25','Masculino','rodrigo.oliveira@gmail.com','(21)90222-4433','20081-002','Rua Segundo de Março, 35','Apto 504','Centro','Rio de Janeiro','RJ',136539);

-- Inserções para a tabela dos treinadores
INSERT INTO Instrutores_Treinos(Nome_Treinador,CPF_Treinador,RG_Treinador,Nascimento_Treinador,Genero_Treinador,Email_Treinador,Celular_Treinador,CEP_Treinador,Endereco_Treinador,Complemento_Treinador,Bairro_Treinador,Cidade_Treinador,Estado_Treinador,Matricula_Treinador,ID_Area,ID_Cargo) VALUES
('Marcos Pereira','123.456.789-01','11.222.333-4','1985-07-22','Masculino','marcos.pereira@titanfit.com.br','(21)98765-1234','20230-010','Rua do Catete, 120','Apto 301','Catete','Rio de Janeiro','RJ',253720,6,9),
('Patrícia Almeida','987.654.321-09','55.444.333-2','1990-02-14','Feminino','patricia.almeida@titanfit.com.br','(21)99872-6543','22041-001','Avenida Nossa Senhora de Copacabana, 500','Casa 10','Copacabana','Rio de Janeiro','RJ',253721,6,9),
('Isabel Santoro','345.678.901-23','22.333.444-5','1992-11-05','Feminino','isabel.santoro@titanfit.com.br','(21)97654-3210','20090-010','Rua da Assembléia, 70','Apto 402','Centro','Rio de Janeiro','RJ',253722,6,9),
('Rafael Costa','765.432.109-87','88.777.666-1','1988-09-10','Masculino','rafael.costa@titanfit.com.br','(21)96543-2109','22420-010','Rua Farme de Amoedo, 90','Apto 1201','Ipanema','Rio de Janeiro','RJ',253723,6,9),
('Luciana Mendes','210.987.654-32','33.222.111-0','1994-04-28','Feminino','luciana.mendes@titanfit.com.br','(21)95432-1098','20250-000','Rua Voluntários da Pátria, 300','Apto 203','Botafogo','Rio de Janeiro','RJ',253724,6,9),
('Gabriel Santos','112.233.445-56','99.888.777-0','1991-01-18','Masculino','gabriel.santos@titanfit.com.br','(21)98765-5432','20770-000','Rua Dias da Cruz, 250','Apto 505','Méier','Rio de Janeiro','RJ',253725,6,9),
('Camila Oliveira','334.455.667-78','66.555.444-3','1987-10-03','Feminino','camila.oliveira@titanfit.com.br','(21)99123-8765','22775-055','Avenida João XXIII, 1000','Bloco 2 - Apto 707','Recreio dos Bandeirantes','Rio de Janeiro','RJ',253726,6,9);

-- Inserções para a tabela dos professores das aulas
INSERT INTO Instrutores_Aulas(Nome_Professor,CPF_Professor,RG_Professor,Nascimento_Professor,Genero_Professor,Email_Professor,Celular_Professor,CEP_Professor,Endereco_Professor,Complemento_Professor,Bairro_Professor,Cidade_Professor,Estado_Professor,Matricula_Professor,ID_Area,ID_Cargo) VALUES
('Carlos Rocha','444.555.666-77','77.888.999-0','1980-11-05','Masculino','carlos.rocha@titanfit.com.br','(21)99123-8765','20720-010','Rua Dias da Cruz, 150','Casa 64','Méier','Rio de Janeiro','RJ',356382,6,9),
('Fernanda Lima','123.098.765-43','99.888.777-6','1987-02-18','Feminino','fernanda.lima@titanfit.com.br','(21)98765-0987','22260-000','Rua Humaita, 200','Apto 102','Botafogo','Rio de Janeiro','RJ',389010,6,9),
('Juliana Souza','333.222.111-99','22.333.444-5','1993-09-30','Feminino','juliana.souza@titanfit.com.br','(21)98123-4567','20500-001','Rua Jardim Botânico, 700','Casa 300','Jardim Botânico','Rio de Janeiro','RJ',355342,6,9),
('Guilher Oliveira','654.321.098-76','44.555.666-7','1990-07-07','Masculino','guilherme.oliveira@titanfit.com.br','(21)99090-8080','22450-000','Avenida Leblon, 500','Aoto 401','Leblon','Rio de Janeiro','RJ',376543,6,9),
('Camila Santos','987.123.456-78','11.000.222-3','1995-01-22','Feminino','camila.santos@titanfit.com.br','(21)98181-7171','20520-000','Rua Uruguai, 45','Sala 305','Tijuca','Rio de Janeiro','RJ',387654,6,9),
('Fernanda Miller','123.098.765-44','99.888.777-7','1987-02-18','Feminino','fernanda.miller@titanfit.com.br','(21)98765-0988','22260-001','Rua Humaita, 201','Apto 103','Botafogo','Rio de Janeiro','RJ',389011,6,9),
('Guilherme Perisé','654.321.098-77','44.555.666-8','1990-07-07','Masculino','guilherme.perise@titanfit.com.br','(21)99090-8081','22450-001','Avenida Leblon, 501','Apto 101','Leblon','Rio de Janeiro','RJ',376544,6,9);

-- Inserções para a tabela de personal trainers
INSERT INTO Personal_Trainers(Nome_Personal,CPF_Personal,RG_Personal,Nascimento_Personal,Genero_Personal,Email_Personal,Celular_Personal,CEP_Personal,Endereco_Personal,Complemento_Personal,Bairro_Personal,Cidade_Personal,Estado_Personal,Matricula_Personal,ID_Area,ID_Cargo) VALUES
('Ana Silveira','012.345.678-90','10.203.405-6','1989-03-10','Feminino','ana.silveira@gmail.com','(21)99876-5400','22790-701','Avenida das Américas, 5000','Bloco 1 - Apto 101','Barra da Tijuca','Rio de Janeiro','RJ',474936,6,9),
('Pedro Alves','109.876.543-21','20.304.506-7','1982-11-25','Masculino','pedro.alves@hotmail.com','(21)98765-4300','20081-000','Rua Primeiro de Março, 33','Apto 502','Centro','Rio de Janeiro','RJ',498547,6,9),
('Mariana Gomes','234.567.890-12','30.405.607-8','1991-06-01','Feminino','mariana.gomes@hotmail.com','(21)97654-3200','22071-000','Rua Raul Pompéia, 10','Casa 2','Copacabana','Rio de Janeiro','RJ',497496,6,9),
('Lucas Pereira','345.678.901-23','40.506.708-9','1987-09-15','Masculino','lucas.pereira@gmail.com','(21)96543-2100','22210-080','Praia do Flamengo, 66','Apto 803','Flamengo','Rio de Janeiro','RJ',499473,6,9),
('Carla Souza','456.789.012-34','50.607.809-0','1993-01-08','Feminino','carla.souza@gmail.com','(21)954321000','22420-041','Rua Barão da Torre, 300','Apto 1001','Ipanema','Rio de Janeiro','RJ',404475,6,9),
('Gustavo Rocha','567.890.123-45','60.708.901-2','1985-04-20','Masculino','gustavo.rocha@gmail.com','(21)99123-4567','20550-010','Rua Uruguai, 150','Sala 301','Tijuca','Riod e Janeiro','RJ',412345,6,9),
('Juliana Lima','678.901.234-56','70.809.012-3','1990-12-05','Feminino','juliana.lima@hotmail.com','(21)98234-5678','22640-102','Avenida Pepi, 99','Cobertura','Jardim Oceânico','Rio de Janeiro','RJ',456789,6,9);

-- Inserções para a tabela dos avaliadores
INSERT INTO Avaliadores_Fisicos(Nome_Avaliador,CPF_Avaliador,RG_Avaliador,Nascimento_Avaliador,Genero_Avaliador,Email_Avaliador,Celular_Avaliador,CEP_Avaliador,Endereco_Avaliador,Complemento_Avaliador,Bairro_Avaliador,Cidade_Avaliador,Estado_Avaliador,Matricula_Avaliador,ID_Area,ID_Cargo) VALUES
('Fernanda Abrel','567.890.123-45','60.708.901-2','1995-04-20','Feminino','fernanda.abrel@titanfit.COM.BR','(21)94321-0900','22775-050','Avenida Ayrton Senna, 2500','Bloco 5 - Apto 202','Barra da Tijuca','Rio de Janeiro','RJ',578901,7,10),
('Gustavo Oliveira','678.901.234-56','70.809.012-3','1980-07-03','Masculino','gustavo.oliveira@titanfit.COM.BR','(21)93210-9800','20230-050','Rua do Lavradio, 90','Bloco 4 - Apto 304','Lapa','Rio de Janeiro','RJ',591234,7,10),
('Patricia Costa','789.012.345-67','80.901.234-5','1990-12-12','Feminino','patricia.costa@titanfit.COM.BR','(21)92109-8700','22450-200','Rua Jardim Botânico, 100','Casa 1','Jardim Botânico','Rio de Janeiro','RJ',500123,7,10),
('Rodrigo Mendes','890.123.456-78','90.123.456-7','1985-02-28','Masculino','rodrigo.mendes@titanfit.COM.BR','(21)91098-7600','22631-450','Avenida Santa Mônica, 1000','Apto 304','Barra da Tijuca','Rio de Janeiro','RJ',589012,8,11),
('Isabela Santos','901.234.567-89','01.234.567-8','1992-08-05','Feminino','isabela.santos@titanfit.COM.BR','(21)90987-6500','22041-060','Rua Toneleros, 50','Apto 601','Copacabana','Rio de Janeiro','RJ',596543,8,11);

-- Inserções para a tabela dos estagiários
INSERT INTO Estagiarios(Nome_Estagiario,CPF_Estagiario,RG_Estagiario,Nascimento_Estagiario,Genero_Estagiario,Email_Estagiario,Celular_Estagiario,CEP_Estagiario,Endereco_Estagiario,Complemento_Estagiario,Bairro_Estagiario,Cidade_Estagiario,Estado_Estagiario,Matricula_Estagiario,ID_Area,ID_Cargo) VALUES
('Rafael Gomes','987.654.321-09','11.223.344-5','1984-10-01','Masculino','rafael.gomes@gmail.com','(21)99012-3456','22250-020','Rua Engenheiro Arthur Moura, 457','Bloco B - Apto 302','Bonsucesso','Rio de Janeiro','RJ',605678,6,1),
('Aline Rodrigues','876.543.210-98','22.334.455-6','1996-03-18','Feminino','aline.rodriguesS@gmail.com','(21)98901-2345','22460-210','Rua Lemos Cunha, 1005','Casa 2','Vicente de Carvalho','Rio de Janeiro','RJ',601234,6,1),
('Felipe Ferreira','765.432.109-87','33.445.566-7','1981-05-22','Masculino','felipe.ferreira@gmail.com','(21)97890-1234','20090-030','Rua das Orquídeas, 100','Casa 3','Jardim Carioca','Rio de Janeiro','RJ',699876,3,4),
('Larissa Dias','654.321.098-76','44.556.677-8','1994-09-07','Feminino','larissa.dias@hotmail.com','(21)96789-0123','22793-080',' Rua Quito, 226','Bloco 1, Apto 405','Penha','Rio de Janeiro','RJ',675000,3,4),
('Daniel Moura','543.210.987-65','55.667.788-9','1988-11-30','Masculino','daniel.moura@hotmail.com','(21)95678-9012','22221-000','Rua Uranos, 1000','Apto 503','Ramos','Rio de Janeiro','RJ',698765,5,5);

-- Inserções para a tabela de dispositivos
INSERT INTO Dispositivos(Nome_Dispositivo,Marca_Dispositivo,Modelo_Dispositivo,Serie_Dispositivo,Localizacao_Dispositivo,Valor_Dispositivo,Aquisicao_Dispositivo,Status_Dispositivo) VALUES
('Desktop 1','Dell','Optiplex 3080','SN123456781','Recepção',3500.00,'2023-01-10','ATIVO'),
('Desktop 2','Dell','Optiplex 3080','SN123456782','Recepção',3500.00,'2023-01-10','ATIVO'),
('Desktop 3','Dell','Optiplex 3080','SN123456783','Recepção',3500.00,'2023-01-10','ATIVO'),
('Modem 1','TP-Link','Archer C6','MD987654321','Sala do CPD',250.00,'2022-05-20','ATIVO'),
('Smart TV 1','Samsung','QLED Q80A','TV567890121','Sala de Aula 1',4500.00,'2024-03-01','ATIVO'),
('Smart TV 2','Samsung','QLED Q80A','TV567890122','Sala de Aula 2',4500.00,'2024-03-01','ATIVO'),
('Caixa de Som Embutida 1','JBL','CI PLUS 6SA','JBP6SA20240715ABCD121','Área de Treino',300.00,'2023-08-15','ATIVO'),
('Caixa de Som Embutida 2','JBL','CI PLUS 6SA','JBP6SA20240715ABCD122','Área de Treino',300.00,'2023-08-15','ATIVO'),
('Caixa de Som Embutida 3','JBL','CI PLUS 6SA','JBP6SA20240715ABCD123','Área de Treino',300.00,'2023-08-15','ATIVO'),
('Switch 1','Cisco','Catalyst 9000','SWCISC001','Sala da Administração',1500.00,'2024-01-15','ATIVO'),
('Switch 2','Cisco','Catalyst 9000','SWCISC002','Sala da Recepção',1500.00,'2024-01-15','MANUTENÇÃO'),
('Switch 3','Cisco','Catalyst 9000','SWCISC003','Sala de Aula',1500.00,'2024-01-15','ATIVO'),
('Switch 4','Cisco','Catalyst 9000','SWCISC004','Sala do CPD',1500.00,'2024-01-15','ATIVO'),
('Access Point 1','Cisco','Catalyst 9100','FOC2612J23N','Área de Treino',800.00,'2023-02-28','ATIVO'),
('Access Point 2','Cisco','Catalyst 9100','FOC2612J23O','Área de Treino',800.00,'2023-02-28','ATIVO'),
('Access Point 3','Cisco','Catalyst 9100','FOC2612J23P','Área de Treino',800.00,'2023-02-28','ATIVO'),
('Nobreak','Intelbras','3000VA','NOBRK001','Sala da Administração',1200.00,'2024-01-15','ATIVO'),
('Roteador 1','TP-Link','Archer BE900','225C13D9A87654321B0E','Sala da Administração',700.00,'2024-01-15','ATIVO'),
('Impressora Multifuncional 1','Epson','L6270','X3YM123456','Sala da Administração',1500.00,'2024-01-15','ATIVO'),
('Impressora Multifuncional 2','Epson','L6270','X3YM123457','Sala da Recepção',1500.00,'2024-01-15','ATIVO'),
('Ar-Condicionado 1','Daikin','FTK12PVE0','E1234567890ABCD','Sala de Treino',2800.00,'2024-01-15','ATIVO'),
('Ar-Condicionado 2','Daikin','FTK12PVE0','E1234567890ABCF','Sala de Treino',2800.00,'2024-01-15','MANUTENÇÃO'),
('Ar-Condicionado 3','Daikin','FTK12PVE0','E1234567890ABCG','Sala de Treino',2800.00,'2024-01-15','ATIVO'),
('Ar-Condicionado 4','Daikin','FTK12PVE0','E1234567890ABCH','Sala de Treino',2800.00,'2024-01-15','ATIVO'),
('Câmera 1','Intelbras','NVR 5016','AB1234567890121','Sala da Recepção',400.00,'2024-01-15','ATIVO'),
('Câmera 2','Intelbras','NVR 5016','AB1234567890122','Sala da RecepçãoO',400.00,'2024-01-15','ATIVO'),
('Câmera 3','Intelbras','NVR 5016','AB1234567890123','Sala da Recepção',400.00,'2024-01-15','INATIVO'),
('Câmera 4','Intelbras','NVR 5016','AB1234567890124','Sala da Recepção',400.00,'2024-01-15','ATIVO'),
('Servidor 1','Dell','Rack PowerEdge R260','SERVPRG001','Sala do CPD',12000.00,'2024-01-15','ATIVO'),
('Servidor 2','Dell','Rack PowerEdge R260','SERVPRG002','Sala do CPD',12000.00,'2024-01-15','MANUTENÇÃO'),
('Firewall','FortiGate','FG-40F','FWRTGT001','Sala do CPD',5000.00,'2024-01-15','ATIVO'),
('Patch Panel Descarregado 48 PORTAS','CommScope (SYSTIMAX)','P360-GS6A-48U','N/A','Sala do CPD',300.00,'2024-01-15','ATIVO'), -- N/A SIGNIFICA NÃO APLICÁVEL
('Rack Servidor','Schneider Electric','NetShelter SX','RACKSRV001','Sala do CPD',800.00,'2024-01-15','ATIVO'),
('Switch 16 portas','TP-Link','TL-SG1016D','SWTPL16001','Sala do CPD',200.00,'2024-01-15','ATIVO');

-- Inserções para a tabela de orçamentos
INSERT INTO Lucros(Materiais_Despesa,Equipamentos_Despesa,Dispositivos_Despesa,Funcionarios_Despesa,Manutencoes_Despesa,Aluguel_Despesa,Contas_Despesa,Planos_Lucro,Data_Lucro) VALUES
(25000.00, 150000.00, 15000.00, 120000.00, 30000.00, 80000.00, 100000.00, 3000000.00, '2025-06-01'),
(1000.00, 3000.00, 1000.00, 120000.00, 25000.00, 1000.00, 200000.00, 4000000.00, '2025-07-01'),
(3000.00, 2000.00, 2000.00, 120000.00, 28000.00, 500.00, 300000.00, 5000000.00, '2025-08-01'),
(2000.00, 1000.00, 500.00, 120000.00, 26500.00, 250.00, 400000.00, 600000.00, '2025-09-01'),
(500.00, 500.00, 250.00, 120000.00, 29000.00, 3000.00, 500000.00, 6000000.00, '2025-10-01'),
(300.00, 700.00, 100.00, 120000.00, 27000.00, 465.00, 600000.00, 4000000.00, '2025-11-01'),
(800.00, 750.00, 1000.00, 120000.00, 30000.00, 700.00, 700000.00, 4000000.00, '2025-12-01');

-- Inserções para a tabela de manutentores
INSERT INTO Profissionais_Manutencao(Nome_Manutentor,CPF_Manutentor,RG_Manutentor,Nascimento_Manutentor,Genero_Manutentor,Email_Manutentor,Celular_Manutentor,CEP_Manutentor,Endereco_Manutentor,Complemento_Manutentor,Bairro_Manutentor,Cidade_Manutentor,Estado_Manutentor,Matricula_Manutentor,ID_Area,ID_Cargo) VALUES
('João Prestes','021.098.765-43','78.901.234-5','1985-11-01','Masculino','joao.prestes@titanfit.com.br','(21)932109876','22790-100','Rua Gilka Machado, 200','Casa 1','Recreio dos Bandeirantes','Rio de Janeiro','RJ',774700,11,13),
('Andressa Pimentel','010.987.654-32','89.012.345-6','1991-05-17','Feminino','andressa.pimentel@titanfit.com.br','(21)921098765','22030-010','Rua Rodolfo Dantas, 30','Apto 1101','Copacabana','Rio de Janeiro','RJ',797300,11,13),
('Guilherme Mello','009.876.543-21','90.123.456-7','1982-07-28','Masculino','guilherme.mello@titanfit.com.br','(21)910987654','20080-010','Rua Visconde de Inhaúma, 50','Apto 305','Centro','Rio de Janeiro','RJ',798900,11,13),
('Renata Alves','998.765.432-10','01.234.567-8','1993-01-09','Feminino','renata.alves@titanfit.com.br','(21)909876543','22400-040','Avenida Atlântica, 1000','Apto 202','Copacabana','Rio de Janeiro','RJ',796000,9,14),
('Paulo Sobral','987.654.321-09','12.345.678-9','1989-04-03','Masculino','paulo.sobral@titanfit.com.br','(21)998765431','22210-000','Rua Marques de Abrantes, 150','Casa 3','Flamengo','Rio de Janeiro','RJ',798800,9,14),
('Fernanda Rocha','976.543.210-98','34.567.890-1','1990-09-15','Feminino','fernanda.rochatitanfit.com.br','(21)987654320','22071-000','Rua Raul Pompéia, 20','Apto 302','Copacabana','Rio de Janeiro','RJ',797400,10,15),
('Marcos Caiafa','965.432.109-87','45.678.901-2','1983-02-20','Masculino','marcos.caiafa@titanfit.com.br','(21)976543210','22775-110','Rua Abelardo Bueno, 1200','Apto 505','Barra da Tijuca','Rio de Janeiro','RJ',778910,11,12);

-- Inserções para a tabela do financeiro
INSERT INTO Profissionais_Financeiro(Nome_Financeiro,CPF_Financeiro,RG_Financeiro,Nascimento_Financeiro,Genero_Financeiro,Email_Financeiro,Celular_Financeiro,CEP_Financeiro,Endereco_Financeiro,Complemento_Financeiro,Bairro_Financeiro,Cidade_Financeiro,Estado_Financeiro,Matricula_Financeiro,ID_Lucro,ID_Area,ID_Cargo) VALUES
('Hortencia Oliveira','123.000.456-78','12.000.456','1980-04-01','Feminino','hortencia.oliveira@titanfit.com.br','(11)98765-0000','01001-000','Avenida Paulista, 1000','Apto 201','Consolação','São Paulo','SP',878915,1,4,16),
('Igor Pereira','987.000.654-32','98.000.654','1992-07-23','Masculino','igor.pereira@titanfit.com.br','(21)97654-0000','20000-000','Rua do Ouvidor, 50',NULL,'Centro','Rio de Janeoro','RJ',878919,2,4,17),
('Juliana Cunha','111.000.222-33','11.000.222','1987-12-05','Feminino','juliana.cunha@titanfit.com.br','(41)99123-0000','80000-000','Rua XV de Novembro, 200','Apto 303','Centro','Curitiba','PR',878943,3,4,18),
('Kleber Alves','555.000.666-77','55.000.666','1970-09-19','Masculino','kleber.alves@titanfit.com.br','(31)98765-1111','30100-000','Avenida Afonso Pena, 100',NULL,'Centro','Belo Horizonte','MG',878770,4,4,19),
('Larissa Silveira','999.000.888-77','99.000.888','1991-03-08','Feminino','larissa.silveira@titanfit.com.br','(51)99234-2222','90001-000','Rua dos Andradas, 123','Casa 16','Centro Histórico','Porte Alegre','RS',878914,5,4,16),
('Marcelo Nunes','333.000.222-11','33.000.222','1984-11-20','Masculino','marcelo.nunes@titanfit.com.br','(61)99876-3333','70002-000','Avenida das Américas, 700','Bloco 8 - Apto 1002','Barra da Tijuca','Rio de Janeiro','RJ',878710,6,4,16);

-- Inserções para a tabela de treinos
INSERT INTO Treinos(Nome_Treino,Repeticoes_Treino,Carga_Treino,Descanso_Treino) VALUES
('Bíceps Alternado com HBC','3X10','15KG','60S'),
('Leg Press','3X10','80KG','60S'),
('Encolhimento de Ombros','3X15','70KG','60S'),
('Prancha Abdominal','3X20','10KG','45S'),
('Graviton Barra Fixa Aberta', '3X8', 'Peso Corporal','90S'),
('Barra Fixa Fechada', '3X ou Máximo Possível', 'Peso Corporal','90S'),
('Remada Curvada Supino Cross Over','3X12', '20KG','60S'),
('Remada Baixa Pronada', '3X10', '40KG','60S'),
('Remada Aberta Curvada HBC','3X10','25KG','60S'),
('Puxada Pronada Articulada','3X12','45KG','60S'),
('Pulldown Corda Cross Over','3X15','20KG','45S'),
('Pulldown Barra Cross Over','3X12','35KG','60S'),
('Pulldown Unilateral Cross Over','3X10','15KG','60S'),
('Remada Baixa Pronada Unilateral','3X10','25KG','60S'),
('Crucifixo Máquina','3X15','30KG','45S'),
('Crucifixo Inclinado','3X12','12KG Cada Lado','60S'),
('Crucifixo Declinado','3X12','10KG Cada Lado','60S'),
('Supino Reto HBL','3X8','30KG Cada Lado','90S'),
('Crucifixo Polia Alta Cross Over','3X15','10KG Cada Lado','45S'),
('Crucifixo Inverso Máquina Pegada Neutra','3X15','25KG','45S'),
('Crucifixo INVERSO Máquina Pegada Pronada', '3X15', '25KG','45S'),
('Crucifixo no Cross Over','3X12','15KG Cada Lado','60S'),
('Crucifixo Polia Baixa Cross Over','3X12','10KG Cada Lado','60S'),
('Afundo no Smith','3X10 Cada Perna','20KG Cada Lado','60S'),
('Cadeira Extensora','3X15','40KG','45S'),
('Elevação Pélvica','3X12','Peso Corporal + 10KG','60S'),
('Cadeira Flexora Unilateral','3X12 cada Perna','15KG','45S'),
('Leg Press 45 Panturrilha','3X15','80KG','45S'),
('Sissy Squat','3X12','Peso Corporal','60S'),
('Belt Squat','3X10','40KG','60S'),
('Agachamento HBL','3X8','40KG','90S'),
('Goblot Squat','3X12','20KG','60S'),
('Cadeira Abdutora','3X15','35KG','45S'),
('Cadeira Adutora','3X15','35KG','45S'),
('Cadeira Flexora','3X15','30KG','45S'),
('Mesa Flexora','3X15','30KG','45S'),
('Abdominal Corda no Cross Over','3X15','25KG','45S'),
('Tríceps Testa Cross Over','3X12','20KG','45S'),
('Tríceps Barra Cross Over','3X12','25KG','45S'),
('Tríceps Corda Cross Over','3X15','20KG','45S'),
('Tríceps Barra V Cross Over','3X12','25KG','45S'),
('Tríceps Coice Cross Over','3X12 Cada Braço','10KG','45S'),
('Facepull','3X15','15KG','45S'),
('Abdução com Flexão de Quadril com Caneleira','3X15 Cada Perna','5KG Caneleira','45S'),
('Pike Push Up','3XAMRAP','Peso Corporal','60S'),
('Abdominal Máquina','3X15','30KG','45S'),
('Abdominal Canivete','3X12','Peso Corporal','45S'),
('Panturrilha Sentado','3X15','40KG','45S'),
('Panturrilha em Pé Unilateral','3X12 Cada Perna','Peso Corporal','45S'),
('Panturrilha Sentado','3X15','40KG','45S'),
('Panturrilha em Pé Unilateral','3X12 Cada Perna','Peso Corporal','45S'),
('Extensão Quadril Cross Over','3X12 Cada Perna','15KG','45S'),
('Pistol no Caixote', '3X8 Cada Perna','Peso Corporal','60S'),
('Agachamento Búlgaro Máquina', '3X10 Cada Perna','20KG','60S'),
('Prisoner Bike','3X15','Peso Corporal','45S'),
('Cadeira Extensora com Insistência','3X10 com 3 Insistências','30KG','60S'),
('Cadeira Flexora com Insistência','3X10 com 3 Insistências','25KG','60S'),
('Agachamento Unilateral na Caixa','3X10 Cada Perna','Peso Corporal','60S'),
('Abdução + Flexão de Ombros HBC','3X10','8KG Cada Lado','60S'),
('Abdução de Ombros Alternado com Isometria HBC','3X10 (Cada Lado + 10s isometria)','7KG (Cada Lado)','60S'),
('Abdução de Ombros','3X12','8KG Cada Lado','60S'),
('Elevação Lateral UnilateralMultivoador','3X12 Cada Lado','10KG','45S'),
('Abdução de Ombro Neutra HBC','3X12','7KG Cada Lado','60S'),
('Abdução de Ombro com Adução Horizontal','3X10','8KG Cada Lado','60S'),
('Flexão de Ombro Cross Over Corda','3X12','10KG','45S'),
('Farmers Walk com Barra Hexagonal','3X30m','40KG Cada Lado','90S'),
('Kettlebell Swing','3X15','16KG','60S'),
('Kettlebell Swing Unilateral','3X10 Cada Braço','12KG','60S'),
('Kettlebell Swing Alternado','3X15','14KG','60S'),
('Encolhimento de Ombro Máquina','3X12','50KG','60S'),
('Dumbbell Snatch','3X8 Cada Lado','15KG','60S'),
('Single Under','3X60 Segundos','Peso Corporal','60S');

-- Inserções para a tabela de equipamentos
INSERT INTO Equipamentos(Nome_Equipamento,Descricao_Equipamento,Marca_Equipamento,Valor_Equipamento,Quantidade_Equipamento) VALUES
('Halteres Emborrachados','Torre de Halteres de 1KG a 10KG Emborrachada Hexagonais','Konnen Fitness',7990.0,4),
('Esteira Premium V6','Tela Smart de 10" e Sensível ao Toque','Konnen Fitness',11690.0,10),
('Multi-Funcional Power Rack','Power Rack Multifuncional de Alta Resistência e Performance','Impulse',15658.0,6),
('Anilha Olímpica','Kit Anilhas de 2,5KG, 5KG, 10KG e 25KG','Konnen Fitness',2048.3,50);

-- Inserções para a tabela de atendimento
INSERT INTO Profissionais_Atendimento(Nome_Atendimento,CPF_Atendimento,RG_Atendimento,Nascimento_Atendimento,Genero_Atendimento,Email_Atendimento,Celular_Atendimento,CEP_Atendimento,Endereco_Atendimento,Complemento_Atendimento,Bairro_Atendimento,Cidade_Atendimento,Estado_Atendimento,Matricula_Atendimento,ID_Area,ID_Cargo) VALUES
('Ana Silveira','201.111.222-33','21.111.222-3','1989-03-11','Feminino','ana.silveira@titanfit.com.br','(21)99876-5401','22790-702','Avenida das Américas, 5001','Bloco 2 - Apto 102','Barra da Tijuca','Rio de Janeiro','RJ',974938,12,24),
('Predro Vasconcelo','202.222.333-44','22.222.333-4','1982-11-26','Masculino','pedro.vasconcelo@titanfit.com.br','(21)98765-4301','20081-001','Rua Segundo de MArço, 34','Apto 503','Centro','Rio de Janeiro','RJ',998549,12,24),
('Mariana Pires','303.333.444-55','23.333.444-5','1991-06-02','Feminino','mariana.pires@titanfit.com.br','(21)97654-3201','22071-001','Rua Raul Pompéia, 11','Casa 3','Copacabana','Rio de Janeiro','RJ',997498,12,24),
('Lucas Fialho','404.444.555-66','34.444.555-6','1987-09-16','Masculino','lucas.fialho@titanfit.com.br','(21)96543-2101','22210-081','Praia do Flamengo, 67','Apto 804','Flamengo','Rio de Janeiro','RJ',999475,12,23),
('Carla Moreira','405.555.666-77','35.555.666-7','1993-01-09','Feminino','carla.moreira@titanfit.com.br','(21)95432-1001','22420-042','Rua São Cristóvão, 1234','Apto 1002','São Cristóvão','RIO DE JANEIRO','RJ',904477,12,22),
('Fernanda Maciel','206.666.777-88','26.666.777-8','1995-04-21','Feminino','fernanda.maciel@titanfit.com.br','(21)94321-0901','22775-051','Rua Áurea, 12','Apto 301','Santa Teresa','RIO DE JANEIRO','RJ',978903,12,21),
('Otávio Santos','107.777.888-99','27.777.888-9','1980-07-04','Masculino','otavio.santos@titanfit.com.br','(21)93210-9801','20230-051','Rua do Lavradio, 91','Apto 118','Lapa','RIO DE JANEIRO','RJ',991236,12,20),
('Patricia Silva','208.888.999-00','48.888.999-0','1990-12-13','Feminino','Patricia.silva@titanfit.com.br','(21)92109-8701','22450-201','Rua Visconde de Santa Isabel, 456','Apto 201','Vila Isabel','RIO DE JANEIRO','RJ',900125,12,20),
('Rodrigo Alves','109.999.000-11','49.999.000-1','1985-02-28','Masculino','rodrigo.alves@titanfit.com.br','(21)91098-7601','22631-451','Rua Pracinha Wallace Paes Leme, 789','Apto 305','Nilópolis','RIO DE JANEIRO','RJ',989014,12,20);

-- INSERÇÕES PARA A TABELA DE TI
INSERT INTO Profissionais_Tecnologia(Nome_TI,CPF_TI,RG_TI,Nascimento_TI,Genero_TI,Email_TI,Celular_TI,CEP_TI,Endereco_TI,Complemento_TI,Bairro_TI,Cidade_TI,Estado_TI,Matricula_TI,ID_Area,ID_Cargo) VALUES
('Leonardo Pereira','087.654.321-09','12.345.678-9','1987-03-20','Masculino','leonardo.pereira@titanfit.com.br','(21)99876-5432','22790-010','Rua Professora Francisca de Carvalho, 100','Casa 3','Recreio dos Bandeirantes','Rio de Janeiro','RJ',074800,5,25),
('Mariana Silva','076.543.210-98','23.456.789-0','1995-08-12','Feminino','mariana.silva@titanfit.com.br','(21)98765-4321','22070-000','Rua Sá Ferreira, 250','Apto 1002','Copacabana','Rio de Janeiro','RJ',097500,5,26),
('Roberto Dias','065.432.109-87','34.567.890-1','1980-11-05','Masculino','roberto.dias@titanfit.com.br','(21)97654-3210','20050-090','Avenida Treze de Maio, 23','Apto 808','Centro','Rio de Janeiro','RJ',098000,5,27),
('Juliana Costa','054.321.098-76','45.678.901-2','1992-06-25','Feminino','juliana.costa@titanfit.com.br','(21)96543-2109','22440-030','Rua General Artigas, 50','Apto 401','Leblon','Rio de Janeiro','RJ',001500,5,28),
('Gabriel Santos','043.210.987-65','56.789.012-3','1983-09-01','Masculino','gabriel.santos@titanfit.com.br','(21)95432-1098','22231-080','Rua das Laranjeiras, 300','Casa 2','Laranjeiras','Rio de Janeiro','RJ',099500,5,28),
('Bianca Oliveira','032.109.876-54','67.890.123-4','1994-02-19','Feminino','bianca.oliveira@titanfit.com.br','(21)94321-0987','22770-060','Rua Gustavo Correa Lima, 10','Apto 201','Jacarepaguá','Rio de Janeiro','RJ',079000,5,29);

-- Inserções ppara a tabela do almoxarifado
INSERT INTO Almoxarifado(Nome_Material,Quantidade_Material,Preco_Material,Data_Material,ID_Manutentor) VALUES
('Desinfetante Multiuso', 75, 10.00, '2025-07-12', 4),
('Pacote de Rolo de Papel Higiênico', 120, 25.00, '2025-07-11', 1),
('Caixa de Canetas Esferográficas', 10, 70.00, '2025-07-10', 3),
('Óleo Lubrificante para Esteira', 15, 40.00, '2025-07-12', 3), -- ID_Manutentor 3, Guilherme Mello
('Kit de Panos de Microfibra', 50, 70.00, '2023-07-11', 3),
('1 Litro Álcool em Gel 70%', 30, 35.00, '2023-07-12', 2),
('Lâmpada Led E27', 25, 35.00, '2025-07-10', 2), -- ID_Manutentor 2, Aandressa Pimentel
('Pacote Sacos de Lixo 100l e 100 Unidades', 80, 50.00, '2021-07-11', 2),
('Kit Pilhas AA 16 Unidades', 20, 70.00, '2021-07-09', 1),
('Rolo Fita Isolante 18mmx10m', 40, 15.00, '2021-07-10', 1), -- ID_Manutentor 1, João Prestes
('Rolo com Cabo de Redes Cat6a 305 Metros', 5, 1800.00, '2024-01-15', 2),
('Kit Instalação de Eletrodutos 3/4 Persnalizado', 3, 205.00, '2024-01-15', 1),
('Guia para Cabos', 100, 35.00, '2024-01-15', 1),
('Kit de Ferramentas Instalação', 2, 95.00, '2024-01-15', 1),
('Kit 2 Microfones sem Fio', 2, 180.00, '2024-01-15', 1);

-- Inserções para a tabela de modalidades do pagamento
INSERT INTO Modalidades_Pagamentos(Nome_Modalidade,Desconto_Modalidade) VALUES
('Dinheiro',0.15),
('Pix',0.15), -- Desconto em pagamentos a vista do plano semestral e anual
('Débito',0.00),
('Crédito',0.00);

-- Inserções para a tabela de planos
INSERT INTO Planos(Nome_Plano,Valor_Plano,ID_Aluno,ID_Modalidade) VALUES
('Mensal',160.0,1,1),
('Trimestral',432.0,2,2),
('Anual',1440.0,3,4), -- ID_Aluno 3 (Pedro Silva) e ID_Modalidade 4 (Crédito)
('Mensal',160.0,4,3),
('Semestral',816.0,5,1), -- ID_Aluno 5 (Lucas Rodrigues) e ID_Modalidade 1 (Dinheiro)
('Mensal',160.0,6,2),
('Trimestral',432.0,7,3),
('Anual',1440.0,8,4),
('Mensal',160.0,9,1),
('Semestral',816.0,10,2),
('Mensal',160.0,11,3),
('Trimestral',432.0,12,4),
('Anual',1440.0,13,1),
('Mensal',160.0,14,2),
('Semestral',816.0,15,3);

-- Inserções o para a tabela de aulas
INSERT INTO Aulas(Nome_Aula,Categoria_Aula,Dia_Aula,Horario_Aula,Capacidade_Aula,Intensidade_Aula,Reserva_Aula,ID_Aluno,ID_Professor,ID_Avaliador) VALUES
('Yoga','Flexibilidade','2025-07-01','08:00:00',15,'Baixa',1,1,1,NULL), -- ID_Aluno 1, ID_Professor 1
('Crossfit','Condicionamento','2025-07-01','10:00:00',20,'Alta',0,1,3,NULL),
('Funcional','Condicionamento','2025-07-09','09:30:00',20,'Baixa',1,2,3,4),
('Boxe','Artes Marciais','2025-07-02','19:00:00',25,'Média',1,4,2,NULL), -- ID_Aluno 4, ID_Professor 2
('Muay Thai','Artes Marciais','2025-07-07','19:00:00',25,'Alta',6,5,2,1),
('Fitdance','Aeróbica','2025-07-03','09:30:00',10,'Média',0,4,4,NULL), -- ID_Aluno 4, ID_Professor 4
('Jump','Aeróbica','2025-07-04','09:30:00',15,'Média',1,3,5,3);

-- Inserções para a tabela dos profissionais da administração
INSERT INTO Profissionais_Administracao(Nome_ADM,CPF_ADM,RG_ADM,Nascimento_ADM,Genero_ADM,Email_ADM,Celular_ADM,CEP_ADM,Endereco_ADM,Complemento_ADM,Bairro_ADM,Cidade_ADM,Estado_ADM,Matricula_ADM,ID_Lucro,ID_Equipamento,ID_Area,ID_Cargo) VALUES
('Marcelo Vieira','111.222.333-44','11.222.333-4','1975-01-20','Masculino','marcelo.vieira@titanfit.com.br','(21)99876-5433','22260-000','Rua São Clemente, 100','Apto 301','Botafogo','Rio de Janeiro','RJ',110101,1,1,3,30),
('Cristina Alves','222.333.444-55','22.333.444-5','1980-05-15','Feminino','cristina.alves@titanfit.com.br','(21)98765-4322','20550-010','Rua Conde Bonfim, 700','Casa 2','Tijuca','Rio de Janeiro','RJ',110102,1,1,3,31),
('Fernando Costa','333.444.555-66','33.444.555-6','1972-11-30','Masculino','fernando.costa@titanfit.com.br','(21)97654-3211','22770-200','Avenida das Américas, 8000','Bloco 10 - Apto 1001','Barra da Tijuca','Rio de Janeiro','RJ',110103,1,1,3,32),
('Ana Reis','444.555.666-77','44.555.666-7','1983-08-25','Feminino','ana.reis@titanfit.com.br','(21)96543-2100','22420-041','Rua Barão da Torre, 500','Apto 202','Ipanema','Rio de Janeiro','RJ',110104,1,1,3,33),
('Roberto Dias','555.666.777-88','55.666.777-8','1979-04-01','Masculino','roberto.dias@titanfit.com.br','(21)95432-1099','20081-000','Rua do Rosário, 20','Casa 3','Centro','Rio de Janeiro','RJ',110105,1,1,3,38);

-- Inserções para a tabela dos profissionais da contratação
INSERT INTO Profissionais_Contratacao(Nome_RH,CPF_RH,RG_RH,Nascimento_RH,Genero_RH,Email_RH,Celular_RH,CEP_RH,Endereco_RH,Complemento_RH,Bairro_RH,Cidade_RH,Estado_RH,Matricula_RH,ID_ADM,ID_Area,ID_Cargo) VALUES
('Fernanda Gomes','123.456.789-01','11.222.333-4','1988-03-10','Feminino','fernanda.gomes@titanfit.com.br','(21)99876-5432','20230-010','Rua do Ouvidor, 10','Apto 501','Centro','Rio de Janeiro','RJ',100111,1,2,35), -- ID_ADM 1 (Marcelo Vieira)
('Gustavo Lima','987.654.321-09','55.444.333-2','1992-07-22','Masculino','gustavo.lima@titanfit.com.br','(21)98765-4321','22041-001','Avenida Atlântica, 1500','Bloco B - Apto 802','Copacabana','Rio de Janeiro','RJ',100101,2,2,36), -- ID_ADM 2 (Cristina Alves)
('Patrícia Fonseca','345.678.901-23','22.333.444-5','1985-11-05','Feminino','patricia.fonseca@titanfit.com.br','(21)97654-3210','20550-010','Rua Mariz e Barros, 600','Casa 12','Tijuca','Rio de Janeiro','RJ',100103,3,2,37), -- ID_ADM 3 (Fernando Costa)
('Rodrigo Silva','765.432.109-87','88.777.666-1','1990-04-18','Masculino','rodrigo.silva@titanfit.com.br','(21)96543-2109','22770-200','Avenida das Américas, 7000','Apto 1203','Barra da Tijuca','Rio de Janeiro','RJ',100104,4,2,36), -- ID_ADM 4 (Ana Paula Reis)
('Carla Mendes','210.987.654-32','33.222.111-0','1994-09-01','Feminino','carla.mendes@titanfit.com.br','(21)95432-1098','20250-000','Rua São Clemente, 250','Apto 304','Botafogo','Rio de Janeiro','RJ',100105,5,2,35); -- ID_ADM 5 (Roberto Dias)

-- Inserções para a tabela de registros da catraca
INSERT INTO Registros_Catraca(Data_Catraca,Hora_Entrada,Hora_Saida,ID_Aluno,ID_Personal,ID_Visitante) VALUES
('2025-07-10', '07:00:00', '09:00:00', 1, NULL, NULL),
('2025-07-10', '08:30:00', '10:30:00', NULL, 1, NULL),
('2025-07-10', '14:00:00', '15:00:00', NULL, NULL, 1),
('2025-07-11', '09:00:00', '11:00:00', NULL, NULL, 2),
('2025-07-11', '17:00:00', '18:00:00', NULL, NULL, 3);

-- Inserções para a tabela de registros de pontos
INSERT INTO Registros_Ponto(Data_Ponto,Hora_Entrada,Hora_Saida,ID_Treinador,ID_Professor,ID_Avaliador,ID_Estagiario,ID_TI,ID_Atendimento,ID_Financeiro,ID_Manutentor,ID_ADM) VALUES
('2025-07-10', '08:00:00', '17:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), -- Registro para Treinador ID 1
('2025-07-10', '09:00:00', '18:00:00', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL), -- Registro para Estagiário ID 1
('2025-07-11', '07:30:00', '16:30:00', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL), -- Registro para TI ID 1
('2025-07-11', '10:00:00', '19:00:00', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL), -- Registro para Atendimento ID 1
('2025-07-12', '08:30:00', '17:30:00', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL); -- Registro para Financeiro ID 1

-- Alterar valores nas colunas
UPDATE Lucros
SET Planos_Lucro = 600000.00
WHERE ID_Lucro = 4;

UPDATE Alunos
SET Complemento_Aluno = 'CASA 186'
WHERE Alunos.ID_Aluno = 5;

-- Apagar tabelas para correção de erros
DROP TABLE IF EXISTS Registros_Ponto;
DROP TABLE IF EXISTS Registros_Catraca;
DROP TABLE IF EXISTS Profissionais_Contratacao;
DROP TABLE IF EXISTS Profissionais_Administracao;
DROP TABLE IF EXISTS Aulas;
DROP TABLE IF EXISTS Planos;

-- Consultas para cada tabela
SELECT * FROM Visitantes;
SELECT * FROM Areas;
SELECT * FROM Cargos;
SELECT * FROM Alunos;
SELECT * FROM Instrutores_Treinos;
SELECT * FROM Instrutores_Aulas;
SELECT * FROM Personal_Trainers;
SELECT * FROM Avaliadores_Fisicos;
SELECT * FROM Estagiarios;
SELECT * FROM Dispositivos;
SELECT * FROM Lucros;
SELECT * FROM Profissionais_Financeiro;
SELECT * FROM Aulas;
SELECT * FROM Treinos;
SELECT * FROM Equipamentos;
SELECT * FROM Profissionais_Atendimento;
SELECT * FROM Profissionais_Tecnologia;
SELECT * FROM Profissionais_Manutencao;
SELECT * FROM Almoxarifado;
SELECT * FROM Modalidades_Pagamentos;
SELECT * FROM Planos;
SELECT * FROM Profissionais_Contratacao;
SELECT * FROM Profissionais_Administracao;
SELECT * FROM Registros_Catraca;
SELECT * FROM Registros_Ponto;

-- Contar todas as aulas que os alunos podem fazer
SELECT Aulas.Nome_Aula,
COUNT(Aulas.ID_Aula)AS Quantidade
FROM Aulas
GROUP BY Aulas.Nome_Aula; -- GROUP BY para agrupar resultados da tabela

-- Somar valores pagos pelos alunos em planos
SELECT
    Planos.Nome_Plano,
    SUM(Planos.Valor_Plano) AS Total_Pago
FROM
    Planos
GROUP BY
    Planos.Nome_Plano;

-- Encontrar a média de lucros
SELECT
    ROUND(AVG(Lucro_Total), 2) AS Media_dos_Lucros -- ROUND para arredondar valores
FROM
    Lucros;

-- Consultar valores específicos dos planos pagos pelos alunos
SELECT  Nome_Aluno,
        Nome_Plano,
        Valor_Plano
FROM    Alunos
        INNER JOIN Planos ON Planos.ID_Plano = Alunos.ID_Aluno
WHERE Valor_Plano > 160 AND Nome_Plano = 'Trimestral';

SELECT  Nome_Aluno,
        Nome_Plano,
        Valor_Plano
FROM    ALUNOS
        INNER JOIN Planos ON Planos.ID_Plano = Alunos.ID_Aluno
WHERE Valor_Plano > 432 OR Nome_Plano='Anual'; -- apenas 1 condição OU 2 verdadeiras

-- Juntar os nomes das tabelas de treinadores, professores e personalL
SELECT  Instrutores_Treinos.Nome_Treinador,
        Instrutores_Aulas.Nome_Professor,
        Personal_Trainers.Nome_Personal
FROM Instrutores_Treinos
INNER JOIN Instrutores_Aulas ON Instrutores_Aulas.ID_Professor = Instrutores_Treinos.ID_Treinador
INNER JOIN Personal_Trainers ON Personal_Trainers.ID_Personal = Instrutores_Treinos.ID_Treinador;

-- Selecionar na tabela dos personal trainers o nome que começa com a letra'A' e os E-mails do gmail.com
SELECT Nome_Personal, Email_Personal
FROM Personal_Trainers
WHERE Nome_Personal LIKE 'A%' AND Email_Personal LIKE '%GMAIL.COM'; -- Encontra string gmail.com independente do que venha antes

-- Selecione do almoxarifado itens que não foram cadastrados entre 2021-01-01 E 2024-12-31
SELECT Nome_Material, Data_Material
FROM Almoxarifado
WHERE Data_Material NOT BETWEEN '2021-01-01' AND '2024-12-31';

-- Consultar os dispositivos que são da marca Dell
SELECT * FROM Dispositivos
WHERE Marca_Dispositivo LIKE 'Dell';

SELECT * FROM Dispositivos;

-- Localizar os equipamento que custem entre 1000 e 3000
SELECT Nome_Dispositivo,Marca_Dispositivo,Valor_Dispositivo
FROM Dispositivos
WHERE Valor_Dispositivo >= 800 AND Valor_Dispositivo < 3000;

-- Consultar estagiárias do sexo feminino
SELECT Nome_Estagiario, Genero_Estagiario
FROM Estagiarios
WHERE NOT Genero_Estagiario = 'Masculino';

-- Selecionar nome de alunos que comecem com a letra 'A'
SELECT Nome_Aluno, Email_Aluno
FROM Alunos
WHERE Nome_Aluno LIKE 'A%';

-- Fazer uma consulta de alunos com o valor pago e a modalidade de pagamento 
CREATE VIEW Pagamento_Aluno AS
SELECT
	Alunos.Nome_Aluno,Planos.Valor_Plano,Nome_Plano
FROM Alunos, Planos
WHERE Alunos.ID_Aluno = Planos.ID_Plano;

SELECT * FROM Pagamento_Aluno; -- Consultar a view criada

-- Fazer uma consulta do nome do funcionário e os dados do ponto
CREATE VIEW Ponto_Funcionario AS
SELECT
        COALESCE( -- retorna valores não nulos
        Instrutores_Treinos.Nome_Treinador,
        Instrutores_Aulas.NOME_PROFESSOR,
        Avaliadores_Fisicos.Nome_Avaliador,
        Estagiarios.Nome_Estagiario,
        Profissionais_Tecnologia.Nome_TI,
        Profissionais_Atendimento.Nome_Atendimento,
        Profissionais_Financeiro.Nome_Financeiro,
        Profissionais_Manutencao.Nome_Manutentor,
        Profissionais_Administracao.Nome_ADM
        ) AS Nome_Funcionario,

        COALESCE(
        Cargos_Treinador.Nome_Cargo,
        Cargos_Professor.Nome_Cargo,
        Cargos_Avaliador.Nome_Cargo,
        Cargos_Estagiario.NOME_CARGO,
        Cargos_TI.Nome_Cargo,
        Cargos_Atendimento.Nome_Cargo,
        Cargos_Financeiro.Nome_Cargo,
        Cargos_Manutentor.Nome_Cargo,
        Cargos_Administracao.Nome_Cargo
        ) AS CARGO_FUNCIONARIO,

        Registros_Ponto.Data_Ponto,
        Registros_Ponto.Hora_Entrada,
        Registros_Ponto.Hora_Saida

FROM    Registros_Ponto
        LEFT JOIN Instrutores_Treinos ON Instrutores_Treinos.ID_Treinador = Registros_Ponto.ID_Treinador
        LEFT JOIN Cargos Cargos_Treinador ON Instrutores_Treinos.ID_Cargo = Cargos_Treinador.ID_Cargo
        LEFT JOIN Instrutores_Aulas ON Instrutores_Aulas.ID_Professor = Registros_Ponto.ID_Professor
        LEFT JOIN Cargos Cargos_Professor ON Instrutores_Aulas.ID_Cargo = Cargos_Professor.ID_Cargo
        LEFT JOIN Avaliadores_Fisicos ON Avaliadores_Fisicos.ID_Avaliador = Registros_Ponto.ID_Avaliador
        LEFT JOIN Cargos Cargos_Avaliador ON Avaliadores_Fisicos.ID_Cargo = Cargos_Avaliador.ID_Cargo
        LEFT JOIN Estagiarios ON Estagiarios.ID_Estagiario = Registros_Ponto.ID_Estagiario
        LEFT JOIN Cargos Cargos_Estagiario ON Estagiarios.ID_Cargo = Cargos_Estagiario.ID_Cargo
        LEFT JOIN Profissionais_Tecnologia ON Profissionais_Tecnologia.ID_TI = Registros_Ponto.ID_TI
        LEFT JOIN Cargos Cargos_TI ON Profissionais_Tecnologia.ID_Cargo = Cargos_TI.ID_Cargo
        LEFT JOIN Profissionais_Atendimento ON Profissionais_Atendimento.ID_Atendimento = Registros_Ponto.ID_Atendimento
        LEFT JOIN Cargos Cargos_Atendimento ON Profissionais_Atendimento.ID_Cargo = Cargos_Atendimento.ID_Cargo
        LEFT JOIN Profissionais_Financeiro ON Profissionais_Financeiro.ID_Financeiro = Registros_Ponto.ID_Financeiro
        LEFT JOIN Cargos Cargos_Financeiro ON Profissionais_Financeiro.ID_Cargo = Cargos_Financeiro.ID_Cargo
        LEFT JOIN Profissionais_Manutencao ON Profissionais_Manutencao.ID_Manutentor = Registros_Ponto.ID_Manutentor
        LEFT JOIN Cargos Cargos_Manutentor ON Profissionais_MANUTENCAO.ID_Cargo = Cargos_Manutentor.ID_Cargo
        LEFT JOIN Profissionais_Administracao ON Profissionais_Administracao.ID_ADM = Registros_Ponto.ID_ADM
        LEFT JOIN Cargos Cargos_Administracao ON Profissionais_Administracao.ID_Cargo = Cargos_Administracao.ID_Cargo;

SELECT * FROM Ponto_Funcionario;

-- Fazer uma consulta de visitantes que passaram pela catraca
CREATE VIEW Catraca_Transeunte AS
SELECT
        COALESCE(
        Alunos.Nome_Aluno,
        Personal_Trainers.Nome_Personal,
        Visitantes.Nome_Visitante
        ) Nome_Transeunte,

        COALESCE(
        Cargos_Personal.Nome_Cargo,
        CASE WHEN Alunos.ID_Aluno IS NOT NULL THEN 'Aluno' ELSE NULL END,
        CASE WHEN Visitantes.ID_Visitante IS NOT NULL THEN 'Visitante' ELSE NULL END
        ) Tipo_Transeunte,

        Registros_Catraca.Data_Catraca,
        Registros_Catraca.Hora_Entrada,
        Registros_Catraca.Hora_Saida

FROM    Registros_Catraca
        LEFT JOIN Alunos ON Registros_Catraca.ID_Aluno = Alunos.ID_Aluno
        LEFT JOIN Personal_Trainers ON Registros_Catraca.ID_Personal = Personal_Trainers.ID_Personal
        LEFT JOIN Cargos Cargos_Personal ON Personal_Trainers.ID_Cargo = Cargos_Personal.ID_Cargo
        LEFT JOIN Visitantes ON Registros_Catraca.ID_Visitante = Visitantes.ID_Visitante;

SELECT * FROM Catraca_Transeunte;

-- Inserir novos alunos na tabela e excluir também
CREATE PROCEDURE Insercao_Aluno
    @Nome_Aluno VARCHAR(30),
    @CPF_Aluno VARCHAR(20),
    @RG_Aluno VARCHAR(15),
    @Nascimento_Aluno DATE,
    @Genero_Aluno VARCHAR(15),
    @Email_Aluno VARCHAR(50),
    @Celular_Aluno VARCHAR(15),
    @CEP_Aluno VARCHAR(10),
    @Endereco_Aluno VARCHAR(50),
    @Complemento_Aluno VARCHAR(30),
    @Bairro_Aluno VARCHAR(30),
    @Cidade_Aluno VARCHAR(25),
    @Estado_Aluno VARCHAR(25),
    @Matricula_Aluno INT
AS
BEGIN
INSERT INTO Alunos(Nome_Aluno,CPF_Aluno,RG_Aluno,Nascimento_Aluno,Genero_Aluno,Email_Aluno,Celular_Aluno,CEP_Aluno,Endereco_Aluno,Complemento_Aluno,Bairro_Aluno,Cidade_Aluno,Estado_Aluno,Matricula_Aluno) VALUES
(@Nome_Aluno,@CPF_Aluno,@RG_Aluno,@Nascimento_Aluno,@Genero_Aluno,@Email_Aluno,@Celular_Aluno,@CEP_Aluno,@Endereco_Aluno,@Complemento_Aluno,@Bairro_Aluno,@Cidade_Aluno,@Estado_Aluno,@Matricula_Aluno)
END;

EXEC Insercao_Aluno 'Daniel Meneses','323.484.535-66','12.232.336-4','1990-07-10','Masculino','daniel.meneses@gmail.com','(21)909876543','21260-002','Rua das Flores, 123','Apto 101','Tijuca','Rio de Janeiro','RJ',998877;

SELECT * FROM Alunos;

-- Apagar inserções de aluno 
DELETE FROM Alunos
WHERE ID_Aluno= 31;

-- Consultar nome do professor, gênero e aula
CREATE PROCEDURE Consulta_Professor
AS
BEGIN
    SELECT
        Instrutores_Aulas.Nome_Professor,
        Instrutores_Aulas.Genero_Professor,
        Aulas.Nome_Aula
    FROM
        Instrutores_Aulas
    LEFT JOIN
        AULAS ON Instrutores_Aulas.ID_Professor = Aulas.ID_Professor;
END;

EXEC Consulta_Professor;

-- Consulta aplicando ordem ascendente ou A-Z
SELECT Nome_Aluno AS Nome_Transeunte, 'Aluno' AS Tipo_Transeunte
FROM Alunos
UNION ALL -- Combina alunos e visitantes em uma lista
SELECT Nome_Visitante AS Nome_Transeunte, 'VISITANTE' AS Tipo_Transeunte
FROM Visitantes
ORDER BY Nome_Transeunte ASC;