function V = vertices2(p,d)

v1 = p + [d; d; d];
v2 = p + [d; -d; d];
v3 = p + [d; -d; -d];
v4 = p + [d; d; -d];
v5 = p + [-d; d; d];
v6 = p + [-d; -d; d];
v7 = p + [-d; -d; -d];
v8 = p + [-d; d; -d];

V = [v1 v2 v3 v4 v5 v6 v7 v8];

end

