# Notes

Reason why xinput_calibrator doesn't work anymore:

https://gist.github.com/KurtJacobson/37288a0300a9c1b3e859c8dcff403300

Transformation matrixes:

```


# xs = x scale
# xk = x skew
# xo = x offset
# ys = y scale
# yk = y skew
# yo = y offset

xs yk xo 
xk ys yo 
0 0 1


```

Debug with:

```

cat /var/log/Xorg.1.log
cat ~/.local/share/xorg/Xorg.0.log

```

List props:

```
DISPLAY=:0 xinput list-props 13
```
