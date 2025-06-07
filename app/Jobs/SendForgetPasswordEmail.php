namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Mail;

class SendForgetPasswordEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $user;
    protected $info;

    public function __construct($user, $info)
    {
        $this->user = $user;
        $this->info = $info;
    }

    public function handle()
    {
        Mail::send('email.forget_password2', $this->info, function ($message) {
            $message->to($this->user->email, $this->user->name)
                    ->subject('Forget Password');
        });
    }
}

