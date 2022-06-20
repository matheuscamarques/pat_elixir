defmodule Pat.Process do
    
    def start(atomo_func) do
        spawn(__MODULE__, atomo_func , [])
    end

    def start_link(atomo_func) do 
        Process.flag(:trap_exit, true)
        spawn_link(__MODULE__, atomo_func , [])

        receive do
            {:EXIT, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
        end
    end

    def start_monitor(atomo_func) do
        spawn_monitor(__MODULE__, atomo_func , [])

        receive do
            {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
        end
    end

    def listen do
        receive do
            any -> IO.puts("Nenhum padrão encontrado! #{any} ")
        end
    end
    
    def exit() do
        exit(:died)
    end
    
    def handle({:message,pid,message}) do
        send pid , message
    end

    def handle(any) do
        IO.puts("Padrão generico encontrado: #{any}")
    end

end