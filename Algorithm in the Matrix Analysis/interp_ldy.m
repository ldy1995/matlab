function [ p ] = interp_ldy( x, y, u, par )
%interplation for 1 order and 2 order using the way of Newton and Lagrange
%   input:
%         x: known variations
%         y: value of x
%         u: calculating point
%         par: 'type' for chosing the interplating way
%              'order' for chosing the interplating order
%   output:
%         p: evaluating value of unknown


% x = [11,12];
% y = [2.3979, 2.4849];
% u = 11.75;
% type = 'Newton';
% order = '1';

type  = par.type;
order = par.order;


switch type
    case 'Newton' % Newton
    switch order
        case '1'
        % 1 order
            D = ( y(2) - y(1) ) / ( x(2) - x(1) );

            p_n = y(1) + D * ( u - x(1) );
        case '2'
        % 2 order
            D1  = ( y(2) - y(1) ) / ( x(2) - x(1) );

            D12 = ( y(3) - y(2) ) / ( x(3) - x(2) );

            D2 = ( D12 - D1 ) / ( x(3) - x(1));

            p_n = y(1) + D1 * ( u - x(1) ) + D2 * (u - x(1)) * (u - x(2));
    end
        p = p_n;
        
    case 'Lagrange'% Lagrange
        switch type
            case '1'
            % 1 order
                l0 = ( u - x(2) ) / ( x(1) - x(2) );
                l1 = ( u - x(1) ) / ( x(2) - x(1) );

                p_l = l0*y(1) + l1*y(2);
            case '2'
            % 2 order
                l0 = ( (u - x(2)) * (u - x(3)) ) / ( (x(1) - x(2)) * (x(1)-x(3)) );
                l1 = ( (u - x(1)) * (u - x(3)) ) / ( (x(2) - x(1)) * (x(2)-x(3)) );
                l2 = ( (u - x(1)) * (u - x(2)) ) / ( (x(3) - x(1)) * (x(3)-x(2)) );

                p_l = l0*y(1) + l1*y(2) + l2*y(3);
        end

        p = p_l;
end

end

