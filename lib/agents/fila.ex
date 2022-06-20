defmodule Pat.Agent.Fila do
   def start() do 
     Agent.start_link(fn -> [] end, name: AgentFila)
   end

   def pop() do
     [a | b] = Agent.get(AgentFila, &(&1))
     Agent.update(AgentFila, fn _ -> b end)
     a
   end

    def push(a) do
      Agent.update(AgentFila, fn (state) -> [a | state] end)
      Agent.get(AgentFila, &(&1))
    end
end