% 修正版Kendall tau计算（避免索引错误）
function tau = kendall_tau_fixed(rank1, rank2)
    n = length(rank1);
    concordant = 0;
    discordant = 0;
    for i = 1:n
        for j = 1:n
            if i ~= j
                % 直接比较排名大小，避免find函数索引问题
                r1 = sign(rank1(i) - rank1(j));
                r2 = sign(rank2(i) - rank2(j));
                if r1 == r2 && r1 ~= 0
                    concordant = concordant + 1;
                elseif r1 ~= r2 && r1 ~= 0 && r2 ~= 0
                    discordant = discordant + 1;
                end
            end
        end
    end
    tau = (concordant - discordant) / (n*(n-1));  % 简化计算
end