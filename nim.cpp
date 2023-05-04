#include <bits/stdc++.h>
using namespace std;

int f[13][13][13][13][13];

int main(){

    int a, b, c, d, e;
    cin >> a >> b >> c >> d >> e;
    int cnt = 0;

    bool validXor = 1;
    for(int i=0;i<=a;i++){
        for(int j=0;j<=b;j++){
            for(int k=0;k<=c;k++){
                for(int l=0;l<=d;l++){
                    for(int m=0;m<=e;m++){
                        int lista[] = {i, j, k, l, m};
                        f[i][j][k][l][m] = 0;
                        for(int u=0;u<5;u++){
                            for(int z=1;z<=3;z++){
                                if(lista[u] < z) break;
                                lista[u] -= z;
                                f[i][j][k][l][m] |= f[lista[0]][lista[1]][lista[2]][lista[3]][lista[4]] ^ 1;
                                lista[u] += z;
                            }
                        }
                        validXor &= f[i][j][k][l][m] == (((i%4) ^ (j%4) ^ (k%4) ^ (l%4) ^ (m%4)) > 0);
                    }
                }
            }
        }
    }

    cout << (validXor?"Todos os xors são válidos\n":"Foi encontrado algum xor invalido\n");
    cout << f[a][b][c][d][e] << '\n';

    return 0;
}