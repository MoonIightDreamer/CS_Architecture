;���������, ����������� ��� ��������� ������������� �����
format PE Console        ; ������ ������ - �������

entry start              ; ����� ������ ����

include 'win32a.inc'

section '.data' data readable writable

        str1 db 'Enter the first number: ', 0
        str2 db 'Enter the second number: ', 0
        strRes db 'Result: %d', 0
        strSpace db ' %d', 0

        A dd ?
        B dd ?

section '.code' code readable executable

        start:

        push str1
        call [printf]

        push A
        push strSpace
        call [scanf]                 ; ���� 1-�� ����������

        push str2
        call [printf]

        push B
        push strSpace
        call [scanf]                 ; ���� 2-�� ����������

        mov ecx, [A]
        add ecx, [B]                 ; ������������

        push ecx
        push strRes
        call[printf]                 ; ����� ����������

        jmp finish

        finish:                      ; ����� ���������

        call [getch]

        push 0
        call [ExitProcess]

section '.idata' import data readable

        library kernel, 'kernel32.dll',\
                msvcrt, 'msvcrt.dll'

        import kernel,\
               ExitProcess, 'ExitProcess'

        import msvcrt,\
               printf, 'printf',\
               scanf, 'scanf',\
               getch, '_getch'