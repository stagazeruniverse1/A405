function thetaepout=thetaes(T,p)
%   in: Td = dewpoint temperature in Kelvin
%       T = temperature in Kelvin
%       p = pressure in Pa
%  out: thetaep = pseudo equivalent potential temperature in Kelvin
%  note that thetaep is not a conserved variable
%  reference: Emanuel 4.7.9 p. 132
  c=constants;
  %parcel is saturated -- prohibit supersaturation with Td > T
  Tlcl=T;
  wv=wsat(T,p);
  thetaval=theta(T,p,wv);
  power=0.2854*(1 - 0.28*wv);
  thetaepout=thetaval*exp(wv*(1 + 0.81*wv)*(3376./Tlcl - 2.54));
  %
  % peg this at 450 so rootfinder won't blow up
  %
  if(thetaepout > 450.)
    thetaepout=450;
  end
