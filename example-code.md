# Just example code snippets

Create, append, print to stderr:
```
## printf 'example string\n' | tee -a "$YT_DLP_HISTORY" >&2
```

Silently create if not exists and append:
```
printf 'example string\n' | tee -a "$LOGFILE" > /dev/null
```


Timestamp for messages:
```
echo "The time is:" "$(date '+%y-%m-%dT%H%M%S%z=@%s')" 
```

```
builtin printf '\n'  | tee -a "$YT_DLP_HISTORY" >&2 # (Because format string does not play nice)
```

Print current scope's argv shell-quoted:
```
builtin printf '"%q" ' "$@" 
```

Print current scope's argv shell-quoted:
```
echo "I was given these args:" "$( builtin printf '"%q" ' "$@" )"
```

Assign filename to a var
```
scriptname="${0##*/}"
```

Print nice looking scriptname for log messages:
```
echo "#[${0##*/}]" "some text" "to be logged"
```

Effectively this line is whatever script.sh contains:
```
source some_script.sh
```