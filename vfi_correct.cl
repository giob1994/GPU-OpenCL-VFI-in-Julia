__kernel void gpuvfi( __global float *V0,
                      __global float *V,
                      __global const float *grid,
                      const int grid_size) 
{
      
        int gid = get_global_id(0);

        float alpha = 0.5f;
        float beta = 0.7f;
        
        float grid_p = grid[gid];

        float V_tmp = -INFINITY;
        float u_arg;
        float V_new;

        for(int i = 0; i <= grid_size; i++) {
            
            u_arg = pow(grid_p, alpha) - grid[i];
            
            if (u_arg > 0) {
                
                V_new = log(u_arg) + beta*V0[i];
                
                if (V_tmp < V_new) {
                    
                    V_tmp = V_new;
                    
                }
                
            } else {
                
                break;
                
            }

        }

         V[gid] = V_tmp;

}