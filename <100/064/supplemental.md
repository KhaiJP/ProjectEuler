###　Making Recurrence Relation
Let we have an expression
```math
{\Large
    \begin{align}
        \frac{\sqrt{n_k} + b_k}{d_k}
    \end{align}
}
```
then this expression can be transformed as following;
```math
{\Large
    \begin{align}
        \frac{\sqrt{n_k} + b_k}{d_k} &= \frac{s_k}{d_k} + \frac{(\sqrt{n_k} + b_k) - s_k}{d_k} \nonumber\\
        &= a_k + \frac{s_k-d_ka_k}{d_k} + \frac{(\sqrt{n_k} + b_k) - s_k}{d_k} \nonumber\\
        &= a_k + \frac{\sqrt{n_k}+b_k-d_ka_k}{d_k} \nonumber\\
        &= a_k + \frac{\sqrt{n_k} - c_k}{d_k} \nonumber\\
        &= a_k + 1/\frac{d_k\sqrt{n_k} + d_kc_k}{n_k-c_k^2} \nonumber\\
        &= a_k + 1/\frac{\sqrt{n_{k+1}}+b_{k+1}}{d_{k+1}},
    \end{align}
}
```
where
```math
{\Large
    \begin{align}
        s_k        &= \lfloor \sqrt{n_k} + b_k \rfloor = \lfloor \sqrt{n_k} \rfloor + b_k \\
        a_k        &= \lfloor \frac{s_k}{d_k} \rfloor \\
        c_k        &= d_ka_k - b_k \\
        n_{k+1}    &= d_k^{\prime2}n_k \\
        b_{k+1}    &= d_k^\prime c_k \\
        d_{k+1}    &= \frac{n_k-c_k^2}{{\rm hcf}} \\
        d_k^\prime &= \frac{d_k}{{\rm hcf}} \\
        {\rm hcf}  &= {\rm gcd}(d_k, n_k - c_k^2).
    \end{align}
}
```
By transforming $(\sqrt{n_{k+1}}+b_{k+1})/d_{k+1}$, next term $a_{k+1}$ can be generated.