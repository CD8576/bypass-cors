import express, { Application, Request, Response } from 'express';
import path from 'path';
import cors from 'cors';
import corsProxy from './routes/corsProxy';
import errorHandler from './utils/error';
import { setSecureHeaders } from "./utils/secureHeaders";

const app: Application = express();
const PORT = process.env.PORT || 6028;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(setSecureHeaders);
app.disable("x-powered-by");

app.use(express.static(path.join(__dirname, '..', 'public')));
app.get('/', (req: Request, res: Response) => {
  res.sendFile(path.join(__dirname, '..', 'public', 'index.html'));
});
app.use('/api', corsProxy);

app.use((req: Request, res: Response) => {
  res.status(404).json({ error: 'Resource not found' });
});

app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`Server running at ${PORT}`);
});