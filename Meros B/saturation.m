function [sat] = saturation(e,e0,u0)
if(e>e0)
sat=u0;
elseif(e<-e0)
sat=-u0;
else
sat=(u0/e0)*e;
end

end