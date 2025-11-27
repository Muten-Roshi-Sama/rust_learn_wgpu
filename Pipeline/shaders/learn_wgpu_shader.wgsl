// learn_wgpu_shader.wgsl


// =========== Vertex shader ===============
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
};

@vertex                         // mark this function as a valid entry point for a vertex shader
fn vs_main(
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;                                  // declare a variable called out using our VertexOutput struct
    let x = f32(1 - i32(in_vertex_index)) * 0.5;            // create two other variables for the x and y of a triangle.
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    return out;
}



// =============== Fragment shader ===============
/* 
    This sets the color of the current fragment to brown.
    - @location(0) bit tells WGPU to store the vec4 value returned by this function in the first color target
    - @builtin(position) : clamp the pixel coordinates to be inside the window (0-800).
        if we want the Position coordinate, have to pass them in separately.

*/

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) vert_pos: vec3<f32>,
}


@vertex
fn vs_main(
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(1 - i32(in_vertex_index)) * 0.5;
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    out.vert_pos = out.clip_position.xyz;
    return out;
}
