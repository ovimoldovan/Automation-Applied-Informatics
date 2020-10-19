float c[3]={0,0,0};
float e[4]={0,0,0, 0};
float in()
{
union u_tag
{
byte b[4];
float fvalue;
} in;
in.fvalue=0;
for (int i=0 ; i<4 ; i++)
{
while (!Serial.available());
in.b[i]=Serial.read();
}
return in.fvalue;
}
void out(float c)
{
union u_tag
{
byte b[4];
float fvalue;
}out;
out.fvalue=c;
Serial.write(out.b[0]);
Serial.write(out.b[1]);
Serial.write(out.b[2]);
Serial.write(out.b[3]);
}
void setup()
{
Serial.begin(9600);
delay(1000);
Serial.write("test");
out(0);
}

void loop()
{
e[0]=in();
//insert below the calculated discrete control function
//c[0]= 33.6*e[0]-30.4*e[1]+c[1];
//c[0] = 1.7346 * e[0] - 1.5694 * e[1] + c[1]; 
c[0] = 9*e[2] - 10*e[3] + e[0] + 3.85*c[0] + -2.85 * c[1];
out(c[0]);
for(int i=2;i>0;i--)
{
c[i]=c[i-1];
e[i]=e[i-1];
}
}
