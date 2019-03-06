#!/bin/bash
#export JAVA_HOME=/opt/jre-home
#export PATH=$PATH:$JAVA_HOME/bin:.
#exec java -jar ./sso-config/target/sso-config.jar &
#sleep 30s
#exec java -jar ./sso-server/target/cas.war

#exec java -jar ./sso-management/target/cas-management.war


#tmux new-session -d -s mySession -n myWindow
#tmux send-keys -t mySession:myWindow "cd ~" Enter
#tmux send-keys -t mySession:myWindow "nano" Enter
#tmux attach -t mySession:myWindow

#tmux new-session -d -s whatever -n myWindow
#session=whatever
#window=${session}:0
#pane=${window}.4
#tmux send-keys -t "$pane" C-z 'some -new command' Enter
#tmux select-pane -t "$pane"
#tmux select-window -t "$window"
#tmux attach-session -t "$session"

# global session
session="work"

# set up tmux
#tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n nano-window

# Select pane 0, set dir to api, run vim
tmux selectp -t 0
# Split pane 1 horizontal by 50%
tmux splitw -h -p 50
tmux send-keys "bash" C-m
tmux splitw -v -p 50
tmux send-keys "bash" C-m
tmux selectp -t 0
tmux send-keys "bash" C-m
tmux splitw -v -p 50
tmux send-keys "bash" C-m

tmux selectp -t 0
tmux send-keys "sleep 3 && exec java -jar ./sso-config/target/sso-config.jar" C-m
#tmux send-keys "bash" C-m

## Select pane 1
tmux selectp -t 1
#tmux send-keys "sleep 40 && echo 'on ready sso-config'" C-m
tmux send-keys "sleep 20 && exec java -jar ./sso-server/target/cas.war" C-m

## select pane 2
tmux selectp -t 2
tmux send-keys "exec java -jar ./sso-monitor/target/sso-monitor.jar" C-m

tmux selectp -t 3
#tmux send-keys "exec java -jar ./sso-support/sso-support-captcha/target/sso-support-captcha.jar" C-m
tmux send-keys "sleep 35 && exec java -jar ./sso-management/target/cas-management.war" C-m

tmux selectp -t 0
tmux attach -t $session:nano-window
