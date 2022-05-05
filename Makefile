PROJ_NAME = Ascii_convertion
SRC =  main.c src/ascii.c src/sum.c

INC =--Iinc\
-Iunity\

ifdef OS
	RM = del 
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
	gcc $(SRC) -Iinc -Iunity -o  $(call FixPath,$(PROJ_NAME).$(EXEC)) -lm
    ./$(call FixPath,$(PROJ_NAME).$(EXEC)) 
	
	 
Static_analysis:
	cppcheck --enable=all $(SRC)

dynamic_analysis: Build
	valgrind ./$(call FixPath,$(PROJ_NAME).$(EXEC)) 


Test : $(TEST_SRC_MAIN)
	gcc $(TEST_SRC_MAIN) -Iinc -Iunity -o  $(call FixPath,$(PROJ_NAME).$(EXEC)) -lm
	./$(call FixPath,$(PROJ_NAME).$(EXEC)) 

Clean :
	$(RM) $(call FixPath,*.out)