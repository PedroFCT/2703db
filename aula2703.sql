--CURSORES

set serveroutput on;

--cursor nome_curso is select colun1_, coluna2_ from nome_tabela;

--open, fetch e close.

--rowtype tambem transfere dados.

-- nome_do_cursor %found, %notfound, %rowcount, %isopen

-------------------------------------------------------------------------------
--EX1

create table funcionario (cd_fun char(3) PRIMARY KEY,
                          nm_fun varchar2(50),
                          salario number(6,2),
                          dt_admissao date);
            
begin
    INSERT INTO FUNCIONARIOS VALUES (1, 'MARCEL', 1000, '17-04-2000');
    INSERT INTO FUNCIONARIOS VALUES (2, 'CLAUDIA', 16000, '02-10-1998');
    INSERT INTO FUNCIONARIOS VALUES (3, 'JOAQUIM', 5500, '10-07-2010');
    INSERT INTO FUNCIONARIOS VALUES (4, 'VALERIA', 7300, '08-06-2015');
END;

DECLARE
    CURSOR EXIBIR_DADOS IS SELECT NM_FUN, SALARIO FROM FUNCIONARIOS;
BEGIN
    open exibir_dados;
END;
--ex2
alter tABLE FUNCIONARIOS ADD TEMPO NUMBER(9);

declare
    V_tempo number(9);
    v_dt_admissao date;
    v_cd_fun number(9);
begin
    select dt_admissao into v_dt_admissao from funcionarios;
    v_tempo := sysdate - v_tempo;
    update funcionarios set tempo = v_tempo where cd_fun = v_cd_fun;
end;

--PARA FUNCIONARIOS COM TEMPO SUPERIOR OU IGUAL A 150 MESES, + 10% AO SALARIO, PARA O RESTANTE 5% 

BEGIN
    
    V_TEMPO_MESES := V_TEMPO / 30;
    V_SALARIO_ANTIGO := V_SALARIO;
    IF V_TEMPO_MESES >= 150 THEN
        UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 0.10;
        DBMS_OUTPUT.PUT_LINE('O SALÁRIO FOI DE ALTERADO DE R$' || V_SALARIO_ANTIGO || 'PARA R$' || V_SALARIO );
    ELSE
        UPDATE FUNCIONARIOS SET SALARIO = SALARIO * 0.05;
        DBMS_OUTPUT.PUT_LINE('O SALÁRIO FOI DE ALTERADO DE R$' || V_SALARIO_ANTIGO || 'PARA R$' || V_SALARIO );
    END IF;
    
END;