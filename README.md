# podcast
Notizen rund um einen geplanten Podcast

## Audio

### [jack_capture](https://github.com/kmatheussen/jack_capture)
```
sudo apt install libjack-jackd2-dev
git https://github.com/kmatheussen/jack_capture.git
cd jack_capture
make
sudo su
PREFIX=/usr/local make install
```
Die ersten beiden JACK-Eingangskanäle in eine WAV-Datei streamen:
```
jack_capture --port system:capture_1 --port system:capture_2
```

### [Calf Studio Gear](https://calf-studio-gear.org/)
```
sudo apt install calf-plugins
```
Die Ausgangskanäle des Plugins _Limiter_ des _Calf Studio Gear's_ in eine WAV-Datei streamen:
```
jack_capture --port "Calf Studio Gear":"Limiter Out #1" --port "Calf Studio Gear":"Limiter Out #2"
```
## Tools

### [tmux](https://github.com/tmux/tmux)
* http://minnano-news.club/tools/tmux-cheatsheet.html
* http://www.strcat.de/eigenes/tmux.html
