PROJ_NAME=Ascii
SRC=main.c src/ascii.c src/sum.c 

TEST_SRC=src/ascii.c src/sum.c test/test_ascii.c unity/unity.c

INC	= -Iinc\
-Iunity\

ifdef OS
   RM = del /q
   FixPath = $(subst /,\,$1)
   EXEC = exe
else
   ifeq ($(shell uname), Linux)
      RM = rm -rf
      FixPath = $1
	  EXEC = out
   endif
endif

Build : $(SRC)
	gcc $(SRC) $(INC) -o $(call FixPath,$(PROJ_NAME).$(EXEC)) -lm
	./$(call FixPath,$(PROJ_NAME).$(EXEC))

Run : Build
        ./$(call FixPath,$(PROJ_NAME).$(EXEC))

static_analysis :
        cppcheck --enable=all $(SRC) $(TEST_SRC)

dynamic_analysis : Build
        valgrind ./$(call FixPath,$(PROJ_NAME).$(EXEC))

coverage :
        gcc -fprofile-arcs -ftest-coverage $(SRC) $(INC) -o $(call FixPath,$(PROJ_NAME).$(EXEC)) -lm
        ./$(call FixPath,$(PROJ_NAME).$(EXEC))
        gcov -a src/project_main.c src/calculator.c

Test : $(TEST_SRC)
        gcc $(TEST_SRC) $(INC) -o $(call FixPath,$(PROJ_NAME).$(EXEC)) -lm
        ./$(call FixPath,$(PROJ_NAME).$(EXEC))
	

