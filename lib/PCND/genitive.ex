defmodule PCND.Genitive do
    @core_genitives %{
        0 => "",
        1=> "jeden",
        2=> "dwóch",
        3=> "trzech",
        4=> "czterech",
        5=> "pięciu",
        6=> "sześciu",
        7=> "siedmiu",
        8=> "ośmiu",
        9=> "dziewięciu",
        10=> "dziesięciu",
        11=> "jedenastu",
        12=> "dwunastu",
        13=> "trzynastu",
        14=> "czternastu",
        15=> "piętnastu",
        16=> "szesnastu",
        17=> "siedemnastu",
        18=> "osiemnastu",
        19=> "dziewiętnastu",
        20=> "dwudziestu",
        30=> "trzydziestu",
        40=> "czterdziestu",
        50=> "pięćdziesięciu",
        60=> "sześćdziesięciu",
        70=> "siedemdziesięciu",
        80=> "osiemdziesięciu",
        90=> "dziewięćdziesięciu",
        100=> "stu",
        200=> "dwustu",
        300=> "trzystu",
        400=> "czterystu",
        500=> "pięciuset",
        600=> "sześciuset",
        700=> "siedmiuset",
        800=> "ośmiuset",
        900=> "dziewięciuset"
    }
        @exp_genitives %{
            {1,:sg}             =>  "",
            {1,:pl}             =>  "",
            {1000,:sg}          =>  "tysiąca",
            {1000,:pl}          =>  "tysięcy",
            {1000000,:sg}   =>  "miliona",
            {1000000, :pl}  =>  "milionów",
            {1000000000,:sg} =>  "miliarda",
            {1000000000,:pl} =>  "miliardów"
        }
        
        def generate_genitives(low, high) do  
            low..high 
            |> Enum.each(&(IO.puts(generate_gen(&1))))
        end


        def generate_gen(1), do: "jednego"
        
        def generate_gen(number), do: gen(number,1,"") |> String.trim
        

        defp gen(0, _exp, postfix), do: postfix

        defp gen(mantissa, exp, postfix) do
            d1 = rem(mantissa,10)
            d2 = div(mantissa,10) |> rem(10)
            d3 = div(mantissa,100) |> rem(10)
            
            curr = rem(mantissa,1000)
            new_mantissa = div(mantissa,1000)
            gen(
                new_mantissa,exp*1000, 
                genx(d3,d2,d1 ,exp) <> " " <> exp_to_string(curr,exp) <> " " <> postfix)

        end

        defp genx(0,0,1,exp) when exp >1, do: ""
        defp genx(0,0,0,_exp), do: ""
        defp genx(d3,d2,d1,_exp) when d2<2, do:  @core_genitives[d3*100]<>" "<>@core_genitives[d2*10+d1]
        defp genx(d3,d2,d1, _exp), do:  @core_genitives[d3*100]<>" "<>@core_genitives[d2*10]<>" "<>@core_genitives[d1]

        defp exp_to_string(1,exp), do: @exp_genitives[{exp,:sg}]   
        defp exp_to_string(_curr_number,exp), do: @exp_genitives[{exp,:pl}]  
end