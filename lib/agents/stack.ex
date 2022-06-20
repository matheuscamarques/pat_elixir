defmodule Pat.Agent.Stack do
   def start() do 
     Agent.start_link(fn -> [] end, name: AgentStack)
   end

   def pop() do
     [a | b] = Agent.get(AgentStack, &(&1))
     Agent.update(AgentAgentStackFila, fn _ -> b end)
     a
   end

    def push(a) do
      Agent.update(AgentStack, fn (state) -> [a | state] end)
      Agent.get(AgentStack, &(&1))
    end
end