/*
 * Copyright (c) 2024 Alyza Alfonso
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module priority_encoder (
    input  wire [15:0] In,       // 16-bit input
    output reg  [7:0]  C         // 8-bit output
);

    always @* begin
        // Initialize C to default value for the special case
        C = 8'b11110000; // This is for the case when all bits are 0

        // Check each bit from the MSB (In[15]) to the LSB (In[0])
        casez (In)
            16'b1???????_??????? : C = 8'd15; // In[15] is 1
            16'b01??????_??????? : C = 8'd14; // In[14] is 1
            16'b001?????_??????? : C = 8'd13; // In[13] is 1
            16'b0001????_??????? : C = 8'd12; // In[12] is 1
            16'b00001???_??????? : C = 8'd11; // In[11] is 1
            16'b000001??_??????? : C = 8'd10; // In[10] is 1
            16'b0000001?_??????? : C = 8'd9;  // In[9] is 1
            16'b00000001_???????: C = 8'd8;  // In[8] is 1
            16'b00000000_1??????: C = 8'd7;  // In[7] is 1
            16'b00000000_01?????: C = 8'd6;  // In[6] is 1
            16'b00000000_001????: C = 8'd5;  // In[5] is 1
            16'b00000000_0001???: C = 8'd4;  // In[4] is 1
            16'b00000000_00001??: C = 8'd3;  // In[3] is 1
            16'b00000000_000001?: C = 8'd2;  // In[2] is 1
            16'b00000000_0000001: C = 8'd1;  // In[1] is 1
            16'b00000000_0000000: C = 8'd0;  // In[0] is 1
        endcase
    end

endmodule

