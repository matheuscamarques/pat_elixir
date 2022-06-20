defmodule Pat.Task do
    def double(a) do
        :timer.sleep(2000)
        a * 2
    end
    
    def main() do
        start_time = :erlang.timestamp() 
        task   = Task.async(__MODULE__, :double, [2000])
        task_b = Task.async(__MODULE__, :double, [3000])
        task_c = Task.async(__MODULE__, :double, [4000])
        

        sum = [
            Task.await(task),
            Task.await(task_b),
            Task.await(task_c)
        ] |> Enum.sum

        end_time = :erlang.timestamp() 
        IO.puts("Tempo de execução: #{:timer.now_diff(end_time,start_time) / 1000000}")
        IO.puts("Resultado: #{sum}")
    end
end