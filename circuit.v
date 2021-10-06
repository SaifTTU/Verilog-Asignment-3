module circuit(F, A, B, C, D);
input A;
input B;
input C;
input D;

// OUTPUT DECLARATIONS

output F;

// WIRE DECLARATIONS

wire w0; //top wires
wire w1;
wire w2;
wire w3;

wire w4; //middle wires
wire w5;

wire w6; //bottom wires
wire w7;
wire w8;

// LOGIC GATES

and u0(w0, A, B);
or u1(w1, w0, C);
not u2(w3, w2);

and u3(w4, w3, D);
and u4(F,w4,w8);

and u5(w2, w1);
and u6(w3, B, E);
or u7(F, w2, w3);

and u8(w6, A, B);
or u9(w7, C, w6);
or u10(w8, D, w7);

endmodule



//TEST BENCH

module circuit_test;
// INPUT REGISTERS
reg A;
reg B;
reg C;
reg D;

//OUTPUT WIRES
wire F;

//UNIT UNDER TEST
circuit UUT(F, A, B, C, D);
initial begin
    $display("A B C D | F");
    //$display("——————");

    //{A, B, C, D, E } = 5’b00000; #10; //delay for ten pico seconds
    for(integer i = 0; i < 16; i = i + 1 ) begin
        {A, B, C, D} = i[3:0]; #10; //only displaying the first 4, delaying 10 pico seconds
        $display("%b %b %b %b | %b", A, B, C, D, F);

    end

end

endmodule
