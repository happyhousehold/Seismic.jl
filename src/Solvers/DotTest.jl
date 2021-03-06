function DotTest(m_rand,d_rand,op,param=Dict())
	# Dot product test for a vector of linear operators

	m_adj = Seismic.adjoint_op(d_rand,op,param)
	d_fwd = Seismic.forward_op(m_rand,op,param)
	inner1 = InnerProduct(d_rand[:],d_fwd[:])
	inner2 = InnerProduct(m_rand[:],m_adj[:])
	println("These values should be close to each other:")
	println("<d_rand,d_fwd> = ",inner1)
	println("<m_rand,m_adj> = ",inner2)

end

function DotTest(m_rand::ASCIIString,d_rand::ASCIIString,op,param=Dict())
	# Dot product test for a vector of linear operators

	m_adj = join(["tmp_DotTest_m_adj_",string(int(rand()*100000))])
	d_fwd = join(["tmp_DotTest_d_adj_",string(int(rand()*100000))])
	Seismic.adjoint_op(m_adj,d_rand,op,param)
	Seismic.forward_op(m_rand,d_fwd,op,param)
	inner1 = InnerProduct(d_rand,d_fwd)
	inner2 = InnerProduct(m_rand,m_adj)
	println("These values should be close to each other:")
	println("<d_rand,d_fwd> = ",inner1)
	println("<m_rand,m_adj> = ",inner2)
	SeisRemove(m_adj)
	SeisRemove(d_fwd)

end

function DotTest(m_rand::Array{ASCIIString,1},d_rand::Array{ASCIIString,1},op,param=Dict())
	# Dot product test for a vector of linear operators
	# for 3 component data
	
	rand_string = string(int(rand()*100000))
	m1_adj = join(["tmp_DotTest_m1_adj_",rand_string])
	m2_adj = join(["tmp_DotTest_m2_adj_",rand_string])
	m3_adj = join(["tmp_DotTest_m3_adj_",rand_string])
	d1_fwd = join(["tmp_DotTest_d1_adj_",rand_string])
	d2_fwd = join(["tmp_DotTest_d2_adj_",rand_string])
	d3_fwd = join(["tmp_DotTest_d3_adj_",rand_string])
	m_adj = [m1_adj;m2_adj;m3_adj]
	d_fwd = [d1_fwd;d2_fwd;d3_fwd]
	Seismic.adjoint_op(m_adj,d_rand,op,param)
	Seismic.forward_op(m_rand,d_fwd,op,param)
	inner1 = InnerProduct(d_rand,d_fwd)
	inner2 = InnerProduct(m_rand,m_adj)
	println("These values should be close to each other:")
	println("<d_rand,d_fwd> = ",inner1)
	println("<m_rand,m_adj> = ",inner2)
	SeisRemove(m_adj);
	SeisRemove(d_fwd);

end
