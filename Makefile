REBAR = ./rebar

all: compile

app: compile
	@$(REBAR) generate force=1

compile:
	@$(REBAR) get-deps compile

tests:
	@$(REBAR) eunit skip_deps=true

clean:
	@$(REBAR) clean
	rm -f erl_crash.dump

dist-clean: clean

